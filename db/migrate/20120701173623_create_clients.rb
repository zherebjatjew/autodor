# encoding : UTF-8

class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|                                      # Физическое лицо Юридическое лицо
      t.boolean :organization, :null => false, :default => false      # =false          =true
      t.string :name, :null => false                                  # ФИО             Наименование организации
      t.date :born_at                                                 # Дата рождения   Дата регистрации
      t.string :identity                                              # № паспорта      ИНН
      t.string :address                                               #             Адрес
      t.string :contact                                               #                 Контактное лицо
      t.string :schedule                                              #                 Часы работы
      t.string :note                                                  #            Заметки

      t.timestamps
    end
  end
end
