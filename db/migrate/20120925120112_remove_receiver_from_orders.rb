class RemoveReceiverFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :receiver_id
        remove_column :orders, :receiver_date
      end

  def down
    add_column :orders, :receiver_date, :datetime
    add_column :orders, :receiver_id, :integer
  end
end
