# encoding : UTF-8

class Shipper < ActiveRecord::Base
  attr_accessible :account, :address1, :address2, :ati, :bic, :contact, :corr_account, :director, :director_short, :email, :registration, :inn, :kpp, :name, :ogrn, :phones

  has_many :drivers
  belongs_to :author, :class_name => 'User'
  has_many :orders, :foreign_key => 'shipper_id'

  validates :name, :uniqueness => true

  # TODO Add account numbers validation.
end
