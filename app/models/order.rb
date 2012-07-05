# encoding: UTF-8

class Order < ActiveRecord::Base
  attr_accessible :info, :forwarder_id, :committed_at, :signed, :paid, :completed
  belongs_to :user
  has_one :forwarder, :class_name => 'User'
  has_one :client
  has_one :sender, :class_name => 'Client'
  has_one :receiver, :class_name => 'Client'
  validates :user_id, :presence => true
  validates :forwarder_id, :presence => true

  def forwarder
  	User.find forwarder_id
  end

  def forwarder= user
  	forwarder_id = user.nil? ? nil : user.id
  end
end
