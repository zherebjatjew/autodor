# encoding : UTF-8

class Car < ActiveRecord::Base
  attr_accessible :identity, :model, :payload_kg, :type, :volume_m, :driver_id

  belongs_to :driver
end
