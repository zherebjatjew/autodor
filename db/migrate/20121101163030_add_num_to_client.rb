# encoding : UTF-8

class AddNumToClient < ActiveRecord::Migration
  def up
    add_column :clients, :num, :integer, :default => 0, :null => false

    Client.all.each { |c| c.update_attribute :num, c.id }
  end

  def down
    remove_column :clients, :num
  end
end
