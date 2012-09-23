# encoding: UTF-8
#
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

if User.find_by_email('zherebjatjew@gmail.com').nil?
  User.create!(:name => "Жеребятьев Дмитрий",
               :email => "zherebjatjew@gmail.com",
               :password => "123456",
               :password_confirmation => "123456",
               :role => "admin")
end

if User.find_by_email('avtodor55@gmail.com').nil?
  User.create!(:name => "Селиванова Наталья",
               :email => "avtodor55@gmail.com",
               :password => "123456",
               :password_confirmation => "123456",
               :role => "admin")
end

if Car.all.empty?
  Car.create!(:model => 'Нет',
              :is_trailer => true)
end

if WorkflowNames.all.empty?
# Create workflow definition
  wnew = WorkflowNames.create!(:name => 'Новый', :image => 'workflows/new')
  wcommitted = WorkflowNames.create!(:name => 'Оформлен', :image => 'workflows/committed')
  wsigned = WorkflowNames.create!(:name => 'Подписан', :image => 'workflows/signed')
  wpaid = WorkflowNames.create!(:name => 'Оплачен', :image => 'workflows/paid')
  wcomplete = WorkflowNames.create!(:name => 'Выполнен', :image => 'workflows/complete')
  wcancelled = WorkflowNames.create!(:name => 'Отменён', :image => 'workflows/cancelled')

# Create workflow state machine
  Workflows.create!(:current => wnew, :next => wnew)
  Workflows.create!(:current => wnew, :next => wcommitted)
  Workflows.create!(:current => wnew, :next => wcancelled)
  Workflows.create!(:current => wcommitted, :next => wcommitted)
  Workflows.create!(:current => wcommitted, :next => wsigned)
  Workflows.create!(:current => wcommitted, :next => wcancelled)
  Workflows.create!(:current => wsigned, :next => wsigned)
  Workflows.create!(:current => wsigned, :next => wpaid)
  Workflows.create!(:current => wsigned, :next => wcancelled)
  Workflows.create!(:current => wpaid, :next => wpaid)
  Workflows.create!(:current => wpaid, :next => wcomplete)
  Workflows.create!(:current => wpaid, :next => wcancelled)
  Workflows.create!(:current => wcomplete, :next => wnew)
end
