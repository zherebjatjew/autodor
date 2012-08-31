class Driver < ActiveRecord::Base
  attr_accessible :name, :born_at, :identity, :address, :note
  has_many :orders
end