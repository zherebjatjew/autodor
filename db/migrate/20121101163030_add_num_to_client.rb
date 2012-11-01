class AddNumToClient < ActiveRecord::Migration
  def change
    add_column :clients, :num, :integer, :default => 0, :null => false
  end
end
