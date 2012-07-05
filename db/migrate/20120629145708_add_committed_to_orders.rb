# encoding : UTF-8

class AddCommittedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :committed_at, :date
    add_column :orders, :forwarder_id, :number
  end
end
