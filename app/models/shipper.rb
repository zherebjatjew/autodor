# encoding : UTF-8

class Shipper < ActiveRecord::Base
  attr_accessible :account, :address1, :address2, :ati, :bic, :contact, :corr_account, :director, :director_short,
                  :email, :registration, :inn, :kpp, :name, :ogrn, :phones, :num

  before_save { self.num = Client.next if num == 0  }

  has_many :drivers
  belongs_to :author, :class_name => 'User'
  has_many :orders, :foreign_key => 'shipper_id'

  validates :name, :uniqueness => true

  # TODO Add account number validation.

  def identifier
    num
  end

  def self.next
    lst = all.sort_by{|value| -value.id}.first()
    lst.nil? ? 1 : lst.id+1
  end
end
