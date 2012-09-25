class RemoveSenderFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :sender_id
        remove_column :orders, :sender_date
      end

  def down
    add_column :orders, :sender_date, :datetime
    add_column :orders, :sender_id, :integer
  end
end
