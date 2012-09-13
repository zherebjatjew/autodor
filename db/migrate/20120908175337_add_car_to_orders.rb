# encoding : UTF-8

class AddCarToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :truck_id, :integer
    add_column :orders, :trailer_id, :integer
  end
end
