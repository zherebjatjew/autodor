# encoding : UTF-8

class CarOwner < ActiveRecord::Base
  attr_accessible :car_id, :driver_id

  has_many :cars
  has_many :drivers
  belongs_to :author, :class_name => 'User'
end
