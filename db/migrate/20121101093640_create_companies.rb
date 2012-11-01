# encoding : UTF-8

class CreateCompanies < ActiveRecord::Migration
  def up
    create_table :companies do |t|
      t.string :name
      t.string :address1
      t.string :address2, :default => ""
      t.string :faxes
      t.string :inn
      t.string :kpp
      t.string :account
      t.string :corr_account
      t.string :ati
      t.string :bic
      t.date :born_at
      t.string :identity
      t.string :schedule
      t.string :phones
      t.string :email
      t.string :director
      t.string :director_short
      t.boolean :organization, :default => true
      t.string :contact

      t.timestamps
    end

    Company.create!(
      :name => "ООО «АвтоДор Омск»",
      :address1 => "644047, г.Омск, ул. 2-я Береговая, 17а",
      :address2 => "",
      :phones => "89136783350 – МТС, 83812465717-ГТС",
      :faxes => "83812465717",
      :schedule => "",
      :inn => "5503234484",
      :kpp => "550301001",
      :account => "40702810918100024299",
      :corr_account => "30101810000000000201",
      :ati => "ОАО АКБ «АВАНГАРД» г.Москва",
      :bic => "044525201",
      :director => "Осипова Сергея Владимировича",
      :email => "avtodor55@gmail.com",
      :identity => "Устава",
      :contact => "Осипов Сергей Владимирович",
      :director_short => "Осипов С.В."
    )
  end

  def down
    drop_table :compaines
  end
end
