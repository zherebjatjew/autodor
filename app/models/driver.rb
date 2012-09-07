# encoding : UTF-8

cclass Driver < ActiveRecord::Base
  attr_accessible :name, :born_at, :identity, :address, :note, :phone
  has_many :orders
end
