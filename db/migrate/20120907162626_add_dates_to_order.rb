class AddDatesToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :sender_date, :datetime
    add_column :orders, :receiver_date, :datetime
  end
end
