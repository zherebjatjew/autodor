# encoding: UTF-8

class Cargo < ActiveRecord::Base
  include Converter

  attr_accessible :bill_date, :bill_id, :cost, :lift, :load, :name, :packing, :payment_notes, :pneumo,
                  :requirements, :seal, :temperature, :train_type, :transportation_charge, :volume_m,
                  :weight_kg

  belongs_to :order

end
