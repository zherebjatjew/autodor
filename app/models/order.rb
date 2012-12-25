# encoding: UTF-8

class Order < ActiveRecord::Base
  attr_accessible :info, :forwarder_id, :committed_at,
                  :signed, :paid, :completed, :client_id,
                  :driver_id, :cargos_attributes,
                  :truck_id, :trailer_id, :shipper_id,
                  :status_id, :num

  belongs_to :user
  has_one :forwarder, :class_name => 'User'
  has_one :client
  has_one :receiver, :class_name => 'Client'
  belongs_to :shipper
  has_many :cargos
  has_one :driver
  belongs_to :truck, :class_name => 'Car'
  belongs_to :trailer, :class_name => 'Car'
  belongs_to :author, :class_name => 'User'

  before_save { self.num = Order.next if num == 0 }

  class WorkflowValidator < ActiveModel::Validator
    def validate(record)
      # current_user is not available from a model
#      is_admin = current_user.nil? || current_user.admin?
      is_admin = true
      if record.new_record?
        if record.status_id != 1
          record.errors[:base] << "Недопустимое начальное состояние заявки"
        end
      else
        old = Order.find record.id
        if Workflow.allowed(old.status_id, is_admin).find(record.status_id).nil?
          record.errors[:base] << "Переход в это состояние невозможен"
        end
      end
    end
  end

  validates :user_id, :presence => true
  validates :forwarder_id, :presence => true
  validates :client_id, :presence => true
  validates_associated :cargos
#  validates_with WorkflowValidator

  accepts_nested_attributes_for :cargos, :allow_destroy => true

  def forwarder
  	User.find forwarder_id
  end

  def forwarder= (user)
    self.forwarder_id = user.nil? ? nil : user.id
  end

  def client
    Client.find client_id
  end

  def self.next
    lst = Order.order("num DESC").first()
    lst.nil? ? 1 : lst.id+1
  end

  def checkpoints
    senders = []
    receivers = []
    cargos.each do |cargo|
#      if senders.empty? || senders[-1].id != cargo.sender_id
        senders << cargo.sender
#      end
#      if receivers.empty? || receivers[-1].id != cargo.receiver_id
        receivers << cargo.receiver
#      end
    end
    [senders, receivers]
  end

  def driver
    Driver.find driver_id
  end

  #def cargos
  #  Cargo.all :conditions => "order_id=#{id}"
  #end

  def truck
    truck_id.nil? ? Car.new(:is_trailer => false) : Car.find(truck_id)
  end

end

