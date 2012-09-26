class AddPaymentsToCargo < ActiveRecord::Migration
  def change
    add_column :cargos, :prepay_amount, :decimal, :default => 0
    add_column :cargos, :inner_charge, :decimal, :default => 0
  end
end
