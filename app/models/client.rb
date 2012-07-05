class Client < ActiveRecord::Base
  attr_accessible :address, :born_at, :contact, :identity, :name, :note, :organization, :working_hours
end
