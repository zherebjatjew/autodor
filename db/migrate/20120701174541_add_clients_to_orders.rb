class AddClientsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :client_id, :number
    add_column :orders, :sender_id, :number
    add_column :orders, :receiver_id, :number
  end
end
