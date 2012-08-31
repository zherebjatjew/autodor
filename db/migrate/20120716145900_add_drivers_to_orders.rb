# encoding : UTF-8

class AddDriversToOrders < ActiveRecord::Migration
  def change
    add_column :drivers, :driver_id, :number
  end
end
