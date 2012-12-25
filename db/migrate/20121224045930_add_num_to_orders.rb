class AddNumToOrders < ActiveRecord::Migration
  def up
    add_column :orders, :num, :integer, :default => 0, :null => false
    Order.all.each { |o| o.update_attribute :num, o.id }
  end

  def down
    remove_column :orders, :num
  end
end
