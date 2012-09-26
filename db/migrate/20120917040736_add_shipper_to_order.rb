class AddShipperToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :shipper_id, :integer
  end
end
