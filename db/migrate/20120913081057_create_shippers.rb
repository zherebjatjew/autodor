# encoding : UTF-8

class CreateShippers < ActiveRecord::Migration
  def change
    create_table :shippers do |t|
      t.integer :author_id              # Кто добавил
      t.string :name                    # Наименование организации
      t.string :director                # Директор (в родительном падеже)
      t.string :director_short          # Директор в именительно падеже, кратко: Иванов Ф.М.
      t.string :registration            # Регистрационный документ (в родительном падеже)
      t.string :address1                # Адрес м/я
      t.string :address2                # Почтовый адрес
      t.string :inn                     # ИНН
      t.string :kpp                     # КПП
      t.string :ogrn                    # ОГРН
      t.string :ati                     # Код в АТИ
      t.string :corr_account            # Корр. счёт
      t.string :bic                     # БИК
      t.string :phones                  # Телефоны
      t.string :email                   # Электронная почта
      t.string :contact                 # Ответственное лицо

      t.timestamps
    end
  end
end
