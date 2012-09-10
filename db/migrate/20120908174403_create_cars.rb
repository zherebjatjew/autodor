class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :model                     # Марка автомобиля
      t.string :identity                  # Гос. номер
      t.string :type                      # Тип кузова
      t.float :volume_m                   # Объём кузова
      t.float :payload_kg                 # Полезная нагрузка
      t.boolean :is_trailer               # Прицеп?
      t.integer :driver_id                # Водитель

      t.timestamps
    end
  end
end