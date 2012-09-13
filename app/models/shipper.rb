# encoding : UTF-8

class Shipper < ActiveRecord::Base
  attr_accessible :account, :address1, :address2, :ati, :bic, :contact, :corr_account, :director, :director_short, :email, :registration, :inn, :kpp, :name, :ogrn, :phones

  has_many :drivers
  belongs_to :author, :class_name => 'User'
end
