# encoding: UTF-8
require 'digest'
require File.dirname(File.dirname(__FILE__)) + '/helpers/users_helper'

class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :name, :password, :password_confirmation, :role

  validates :name,     :presence => true,
                       :length   => { :maximum => 50 }
  validates :email,    :presence => true,
                       :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                       :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 6..40 }
#  validates :role,     :inclusion => { :in => UsersHelper.roles, :message => "Такой роли не бывает" }

  before_save :encrypt_password

  has_many :orders

  def admin?
    role == "admin"
  end

  def owns? item
    item.kind_of?(Order) && orders.include?(item)
  end

  def has_password? submitted_password
    encrypted_password == encrypt(submitted_password)
  end

  def self.authentificate email, submitted_password
    user = find_by_email email
    return nil if user.nil?
    return user if user.has_password? submitted_password
  end

  def self.authentificate_with_salt id, cookie_salt
    user = find_by_id id
    (user && user.salt == cookie_salt) ? user : nil
  end

  private

    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt password
    end

    def encrypt string
      secure_hash "#{salt}--#{string}"
    end

    def make_salt
      secure_hash "#{Time.now.utc}--#{password}"
    end

    def secure_hash string
      Digest::SHA2.hexdigest string
    end
end
