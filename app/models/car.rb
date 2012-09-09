# encoding : UTF-8

class Car < ActiveRecord::Base
  attr_accessible :identity, :model, :payload_kg, :type, :volume_m, :driver_id, :is_trailer

  has_many :drivers, :through => 'car_owner'

  def stub
    # Since empty trailer was created as first record in table,
    # we can assume it has the smallest index value
    Car.find 1
  end
end
