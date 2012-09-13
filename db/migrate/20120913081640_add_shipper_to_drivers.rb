class AddShipperToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :shipper_id, :integer
  end
end
