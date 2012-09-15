# encoding: UTF-8

module Converter

  def volume(name = :volume_m)
    value = self.send name
    if value.nil?
      "-"
    else
      "#{nice value} м³"
    end
  end

  def weight(name = :weight_kg)
    value = self.send name
    if value.nil?
      "-"
    elsif value < 1
      "#{nice value*1000} г"
    elsif value < 1000
      "#{nice value} кг"
    else
      "#{nice value/1000} т"
    end
  end

  private

  def nice(value)
    (value + 0.3).round
  end

end
