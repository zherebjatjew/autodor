class AddCommittedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :committed_at, :date
    add_column :orders, :forwarder, :string
  end
end
