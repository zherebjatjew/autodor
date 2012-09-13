# encoding: UTF-8

class Client < ActiveRecord::Base
  attr_accessible :address, :born_at, :contact, :identity, :name, :note, :organization, :schedule, :phones

  belongs_to :author, :class_name => 'User'

  def used?
    !Order.find(:first, :conditions => "client_id=#{id} or sender_id=#{id} or receiver_id=#{id}").nil?
  end
end
