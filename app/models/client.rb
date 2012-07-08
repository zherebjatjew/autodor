class Client < ActiveRecord::Base
  attr_accessible :address, :born_at, :contact, :identity, :name, :note, :organization, :schedule

  def phones
    "xx-xx-xx"
  end
end
