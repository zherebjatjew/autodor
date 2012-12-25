class RemoveBoolsFromOrder < ActiveRecord::Migration
  def up
    remove_column :orders, :signed
    remove_column :orders, :paid
    remove_column :orders, :completed
  end

  def down
    add_column :orders, :signed, :boolean, :default => false, :null => false
    add_column :orders, :paid, :boolean, :default => false, :null => false
    add_column :orders, :completed, :boolean, :default => false, :null => false
  end
end
