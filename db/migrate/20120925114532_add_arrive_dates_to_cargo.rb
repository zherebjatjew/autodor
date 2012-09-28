class AddArriveDatesToCargo < ActiveRecord::Migration
  def change
    add_column :cargos, :sender_date, :date
    add_column :cargos, :receiver_date, :date

    Cargo.all.each do |cargo|
      cargo.sender_date = cargo.order.sender_date
      cargo.receiver_date = cargo.order.receiver_date
    end
  end
end
