# encoding: UTF-8
require 'digest'
require 'client'
require File.dirname(File.dirname(__FILE__)) + '/helpers/application_helper'
require File.dirname(File.dirname(__FILE__)) + '/helpers/users_helper'

class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :name, :password, :password_confirmation, :role, :schedule

  validates :name,     :presence => true
  validates :email,    :presence => true,
                       :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, :message => 'Неверный формат адреса' },
                       :uniqueness => { :case_sensitive => false, :message => 'Такой адрес уже есть в базе' }
  validates :password, :presence => true
  validates :password, :confirmation => true
#  validates :password, :length => { :within => 6..40, :message => '' }
#  validates :role,     :inclusion => { :in => UsersHelper.roles, :message => "Такой роли не бывает" }

  before_save :encrypt_password

  has_many :orders,  :foreign_key => 'forwarder_id'
  has_many :clients, :foreign_key => 'author_id'
  has_many :drivers, :foreign_key => 'author_id'
  has_many :cars,    :foreign_key => 'author_id'

  belongs_to :author, :class_name => 'User'

  include ApplicationHelper

  def admin?
    role == "admin"
  end

  def owns? (item)
    if item.instance_of?(Order)
      item.forwarder_id == id
    else
      item.author_id == id
    end
  end

  def has_password? (submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def to_client
    Client.new(:name => company_name, :contact => name, :address1 => company_address, :phones => company_phones, :schedule => schedule)
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

    def encrypt (string)
      secure_hash "#{salt}--#{string}"
    end

    def make_salt
      secure_hash "#{Time.now.utc}--#{password}"
    end

    def secure_hash (string)
      Digest::SHA2.hexdigest string
    end
end
