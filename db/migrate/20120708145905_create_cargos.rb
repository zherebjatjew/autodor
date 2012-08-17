class CreateCargos < ActiveRecord::Migration
  def change
    create_table :cargos do |t|
      t.string :name                       # Наименование
      t.float :weight_kg                   # Масса, кг
      t.float :volume_m                    # Объём, м*м*м
      t.string :packing                    # Вид упаковки
      t.decimal :cost                      # Объявленная стоимость
      t.string :temperature                # Температурный режим
      t.string :train_type                 # Тип состава
      t.boolean :load                      # Погрузка
      t.boolean :seal                      # Пломба
      t.boolean :pneumo                    # Пневмоподвеска
      t.boolean :lift                      # Лифт
      t.string :requirements               # Дополнительные требования
      t.decimal :transportation_charge     # Ставка за перевозку
      t.string :payment_notes              # Сроки и форма оплаты
      t.integer :bill_id                   # Номер ТТН
      t.date :bill_date                    # Дата ТТН
      t.integer :order_id                  # Идентификатор заявки

      t.timestamps
    end
  end
end
