# encoding : UTF-8

class CarOwner < ActiveRecord::Base
  attr_accessible :car_id, :driver_id
end
