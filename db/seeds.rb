# encoding: UTF-8
#
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create_truck([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create_truck(:name => 'Emanuel', :city => cities.first)

admin = User.create!(:name => "Жеребятьев Дмитрий",
                     :email => "zherebjatjew@gmail.com",
                     :password => "123456",
                     :password_confirmation => "123456",
                     :role => "admin")

User.create!(:name => "Селиванова Наталья",
             :email => "avtodor55@gmail.com",
             :password => "123456",
             :password_confirmation => "123456",
             :role => "admin")

Car.create!(:model => 'Нет',
            :is_trailer => true)

Company.create!(:name => "Рога и копыта",
                :address1 => "Омск",
                :address2 => "Омск",
                :faxes => "444-444",
                :inn => "00000000000091112",
                :kpp => "0000000000000001212",
                :account => "9999999999999321",
                :corr_account => "9999999999923214",
                :ati => "АТИ",
                :bic => "БИК",
                :born_at => "2013.01.01",
                :identity => "Регистрационный документ",
                :schedule => "с 8:00 до 20:00 без выходных",
                :phones => "555-555",
                :email => "user@gmail.com",
                :director => "Иванов Иван Иванович",
                :director_short => "Иванов И.И.",
                :contact => "Петров А.А.");
