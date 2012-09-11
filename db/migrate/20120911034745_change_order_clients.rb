class ChangeOrderClients < ActiveRecord::Migration
  def up
    change_column :orders, :client_id, :integer
    change_column :orders, :sender_id, :integer
    change_column :orders, :receiver_id, :integer
    change_column :orders, :driver_id, :integer
    change_column :orders, :forwarder_id, :integer
  end

  def down
    change_column :orders, :client_id, :number
    change_column :orders, :sender_id, :number
    change_column :orders, :receiver_id, :number
    change_column :orders, :driver_id, :number
    change_column :orders, :forwarder_id, :number
  end
end
