class AddSignedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :signed, :boolean, :default => false, :null => false
    add_column :orders, :paid, :boolean, :default => false, :null => false
    add_column :orders, :completed, :boolean, :default => false, :null => false
  end
end
