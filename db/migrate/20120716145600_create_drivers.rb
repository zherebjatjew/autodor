# encoding : UTF-8

class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :name, :null => false                                  # ФИО
      t.date :born_at                                                 # Дата рождения
      t.string :identity                                              # № паспорта
      t.string :address                                               # Адрес
      t.string :note                                                  # Заметки

      t.timestamps
    end
  end
end
