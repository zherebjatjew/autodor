class AddDirectorToClients < ActiveRecord::Migration
  def change
    add_column :clients, :director, :string, :default => ''
  end
end
