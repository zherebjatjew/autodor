# encoding: UTF-8

class Cargo < ActiveRecord::Base
  include Converter

  attr_accessible :bill_date, :bill_id, :cost, :lift, :load, :name, :packing, :pneumo,
                  :requirements, :seal, :temperature, :train_type, :transportation_charge, :tcharge_notes, :volume_m,
                  :weight_kg, :seat, :inner_charge, :icharge_notes, :prepay_amount, :prepay_notes

  belongs_to :order
  belongs_to :author, :class_name => 'User'
end
