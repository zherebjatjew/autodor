# encoding : UTF-8

class Driver < ActiveRecord::Base
  attr_accessible :name, :born_at, :identity, :address, :note, :phone
  has_many :orders
  has_many :cars
end
