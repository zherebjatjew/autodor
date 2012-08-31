# encoding: UTF-8

class Order < ActiveRecord::Base
  attr_accessible :info, :forwarder_id, :committed_at,
                  :signed, :paid, :completed, :client_id,
                  :sender_id, :receiver_id, :driver_id, :cargo_attributes

  belongs_to :user
  has_one :forwarder, :class_name => 'User'
  has_one :client
  has_one :sender, :class_name => 'Client'
  has_one :receiver, :class_name => 'Client'
  has_many :cargos
  has_one :driver
  
  validates :user_id, :presence => true
  validates :forwarder_id, :presence => true
  validates :client_id, :presence => true
  validates :sender_id, :presence => true
  validates :receiver_id, :presence => true
  validates :driver_id, :presence => true

  accepts_nested_attributes_for :cargos, :allow_destroy => true

  def forwarder
  	User.find forwarder_id
  end

  def forwarder= user
  	forwarder_id = user.nil? ? nil : user.id
  end

  def client
    Client.find client_id
  end

  def sender
    Client.find sender_id
  end

  def receiver
    Client.find receiver_id
  end

  def driver
    Driver.find driver_id
  end

  def cargos
    Cargo.all :conditions => "order_id=#{id}"
  end

end
