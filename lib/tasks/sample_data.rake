# encoding: UTF-8

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Жеребятьев Дмитрий",
                 :email => "zherebjatjew@gmail.com",
                 :password => "123456",
                 :password_confirmation => "123456")
    admin.set_role "admin"
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@autodor.org"
      password = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end

