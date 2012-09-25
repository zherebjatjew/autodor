# encoding: UTF-8

class Cargo < ActiveRecord::Base
  include Converter

  attr_accessible :bill_date, :bill_id, :cost, :lift, :load, :name, :packing, :pneumo,
                  :requirements, :seal, :temperature, :train_type, :transportation_charge, :volume_m, :weight_kg, :seat,
                  :inner_charge, :icharge_notes, :prepay_amount, :prepay_notes, :tcharge_notes, 
                  :receiver_id, :receiver_date, :sender_id, :sender_date

  belongs_to :order
  belongs_to :receiver, :class_name => 'Client'
  belongs_to :sender, :class_name => 'Client'
  belongs_to :author, :class_name => 'User'
end
