class CreateCargos < ActiveRecord::Migration
  def change
    create_table :cargos do |t|
      t.string :name
      t.float :weight_kg
      t.float :volume_m
      t.string :packing
      t.decimal :cost
      t.string :temperature
      t.string :train_type
      t.boolean :load
      t.boolean :seal
      t.boolean :pneumo
      t.boolean :lift
      t.string :requirements
      t.decimal :transportation_charge
      t.string :payment_notes
      t.integer :bill_id
      t.date :bill_date
      t.integer :order_id

      t.timestamps
    end
  end
end
