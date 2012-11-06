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

  def stub?
    id == 1
  end

  def used?
    if is_trailer?
      !Order.find_by_trailer_id(id).nil?
    else
      !Order.find_by_truck_id(id).nil?
    end
  end

  def self.trucks
    Car.where :is_trailer => false
  end

  def self.trailers(real_only = false)
    if real_only
      Car.where(:is_trailer => true).where('id != 1')
    else
      Car.where :is_trailer => true
    end
  end

end
