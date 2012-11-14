# encoding : UTF-8

class AddNumToShipper < ActiveRecord::Migration
  def up
    add_column :shippers, :num, :integer

    Shipper.all.each { |s| s.update_attribute :num, s.id }
  end

  def down
    remove_column :shippers, :num
  end
end
