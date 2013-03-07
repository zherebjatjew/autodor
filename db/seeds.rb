# encoding: UTF-8
#
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create_truck([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create_truck(:name => 'Emanuel', :city => cities.first)

###########################################################
# Users
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

###########################################################
# Trucks & trailers
Car.create!(:model => 'Нет',
            :is_trailer => true)

###########################################################
# Company
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

################################################################
# Workflows
WorkflowName.create! :name => 'Новая', :weight => 1
WorkflowName.create! :name => 'Согласована', :weight => 2
WorkflowName.create! :name => 'Авансирована', :weight => 3
WorkflowName.create! :name => 'Погрузка', :weight => 4
WorkflowName.create! :name => 'Доставка', :weight => 5
WorkflowName.create! :name => 'Доставлена', :weight => 6
WorkflowName.create! :name => 'Оплачена', :weight => 7
WorkflowName.create! :name => 'Закрыта', :weight => 8
WorkflowName.create! :name => 'Отменена', :weight => 9
WorkflowName.create! :name => 'Приостановлена', :weight => 10

# Cancel
Workflow.create! :from_id => 1, :to_id => 9, :admin_only => true
Workflow.create! :from_id => 2, :to_id => 9, :admin_only => true
Workflow.create! :from_id => 3, :to_id => 9, :admin_only => true
Workflow.create! :from_id => 4, :to_id => 9, :admin_only => true
Workflow.create! :from_id => 5, :to_id => 9, :admin_only => true
Workflow.create! :from_id => 6, :to_id => 9, :admin_only => true
Workflow.create! :from_id => 7, :to_id => 9, :admin_only => true

# Suspend
Workflow.create! :from_id => 1, :to_id => 10, :admin_only => true
Workflow.create! :from_id => 2, :to_id => 10, :admin_only => true
Workflow.create! :from_id => 3, :to_id => 10, :admin_only => true
Workflow.create! :from_id => 4, :to_id => 10, :admin_only => true
Workflow.create! :from_id => 5, :to_id => 10, :admin_only => true
Workflow.create! :from_id => 6, :to_id => 10, :admin_only => true
Workflow.create! :from_id => 7, :to_id => 10, :admin_only => true

# Normal workflows
Workflow.create! :from_id => 1, :to_id => 2
Workflow.create! :from_id => 2, :to_id => 3
Workflow.create! :from_id => 2, :to_id => 4
Workflow.create! :from_id => 3, :to_id => 2
Workflow.create! :from_id => 3, :to_id => 4
Workflow.create! :from_id => 4, :to_id => 5
Workflow.create! :from_id => 5, :to_id => 6
Workflow.create! :from_id => 6, :to_id => 7
Workflow.create! :from_id => 7, :to_id => 8

# Rollbacks
Workflow.create! :from_id => 2, :to_id => 1
Workflow.create! :from_id => 3, :to_id => 2
Workflow.create! :from_id => 5, :to_id => 4
Workflow.create! :from_id => 6, :to_id => 5
Workflow.create! :from_id => 7, :to_id => 6
Workflow.create! :from_id => 8, :to_id => 7

# Admin corrections (can do anything)
Workflow.create! :from_id => 9, :to_id => 1, :admin_only => true
Workflow.create! :from_id => 9, :to_id => 2, :admin_only => true
Workflow.create! :from_id => 9, :to_id => 3, :admin_only => true
Workflow.create! :from_id => 9, :to_id => 4, :admin_only => true
Workflow.create! :from_id => 9, :to_id => 5, :admin_only => true
Workflow.create! :from_id => 9, :to_id => 6, :admin_only => true
Workflow.create! :from_id => 9, :to_id => 7, :admin_only => true
Workflow.create! :from_id => 9, :to_id => 8, :admin_only => true
Workflow.create! :from_id => 9, :to_id => 8, :admin_only => true
Workflow.create! :from_id => 9, :to_id => 10, :admin_only => true
Workflow.create! :from_id => 10, :to_id => 1, :admin_only => true
Workflow.create! :from_id => 10, :to_id => 2, :admin_only => true
Workflow.create! :from_id => 10, :to_id => 3, :admin_only => true
Workflow.create! :from_id => 10, :to_id => 4, :admin_only => true
Workflow.create! :from_id => 10, :to_id => 5, :admin_only => true
Workflow.create! :from_id => 10, :to_id => 6, :admin_only => true
Workflow.create! :from_id => 10, :to_id => 7, :admin_only => true
Workflow.create! :from_id => 10, :to_id => 8, :admin_only => true
Workflow.create! :from_id => 10, :to_id => 8, :admin_only => true
Workflow.create! :from_id => 10, :to_id => 9, :admin_only => true
