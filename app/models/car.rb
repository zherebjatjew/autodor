# encoding : UTF-8

class Car < ActiveRecord::Base
  include Converter

  attr_accessible :identity, :model, :payload_kg, :base, :volume_m, :is_trailer

  has_many :drivers, :through => 'car_owner'
  has_many :orders, :foreign_key => 'truck_id'
  belongs_to :author, :class_name => 'User'

  def stub
    # Since empty trailer was created as first record in table,
    # we can assume it has the smallest index value
    Car.find 1
  end

  def self.trucks
    Car.where :is_trailer => false
  end

end
