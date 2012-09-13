# encoding : UTF-8

class AddPhoneToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :phone, :string
  end
end
