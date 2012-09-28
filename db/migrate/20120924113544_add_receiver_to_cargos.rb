class AddReceiverToCargos < ActiveRecord::Migration
  def change
    add_column :cargos, :receiver_id, :integer
    add_column :cargos, :sender_id, :integer

    Cargo.all.each do |cargo|
      cargo.receiver_id = cargo.order.receiver_id
      cargo.sender_id = cargo.order.sender_id
      cargo.save
    end
  end
end
