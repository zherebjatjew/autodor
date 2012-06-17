Factory.define :user do |user|
  user.name                  "Dimtry Zherebjatjew"
  user.email                 "zherebjatjew@gmail.com"
  user.password              "123456"
  user.password_confirmation "123456"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end
