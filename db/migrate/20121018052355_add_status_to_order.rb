class AddStatusToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :status_id, :integer, :default => 1
  end
end
