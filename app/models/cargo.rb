# encoding: UTF-8

class Cargo < ActiveRecord::Base
  attr_accessible :bill_date, :bill_id, :cost, :lift, :load, :name, :packing, :payment_notes, :pneumo,
                  :requirements, :seal, :temperature, :train_type, :transportation_charge, :volume_m,
                  :weight_kg

  belongs_to :order

  def volume
    volume_m.nil? "-" : "#{nice volume_m} м³"
  end

  def weight
    if weight_kg.nil?
      "-"
    elsif weight_kg < 1
      "#{nice weight_kg*1000} г"
    elsif weight_kg < 1000
      "#{nice weight_kg} кг"
    else
      "#{nice weight_kg/1000} т"
    end
  end

  private

    def nice value
      (value + 0.3).round
    end

end
