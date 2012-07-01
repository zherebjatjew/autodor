# encoding : UTF-8

class AddPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :encrypted_password, :string
  end
end
