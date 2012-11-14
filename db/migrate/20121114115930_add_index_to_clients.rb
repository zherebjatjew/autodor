class AddIndexToClients < ActiveRecord::Migration
  def change
    add_index :clients, :num, :name => 'idx_clients_num'
  end
end
