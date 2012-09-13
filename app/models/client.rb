# encoding: UTF-8

class Client < ActiveRecord::Base
  attr_accessible :address, :born_at, :contact, :identity, :name, :note, :organization, :schedule

  belongs_to :author, :class_name => 'User'

  before_save AuthorAssigner.new

  def used?
    !Order.find(:first, :conditions => "client_id=#{id} or sender_id=#{id} or receiver_id=#{id}").nil?
  end

  def phones
    "xx-xx-xx"
  end
end
