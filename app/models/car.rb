# encoding : UTF-8

class Car < ActiveRecord::Base
  include Converter

  attr_accessible :identity, :model, :payload_kg, :base, :volume_m, :is_trailer

  has_many :drivers, :through => 'car_owner'
  has_many :orders, :foreign_key => 'truck_id'

  def stub
    # Since empty trailer was created as first record in table,
    # we can assume it has the smallest index value
    Car.find 1
  end

end
