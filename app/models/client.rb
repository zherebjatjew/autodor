# encoding: UTF-8

class Client < ActiveRecord::Base
  attr_accessible :address1, :address2, :faxes, :inn, :kpp, :account, :corr_account, :ati, :bic, :born_at, :contact, :identity, :name, :note, :organization, :schedule, :phones, :email, :director

  belongs_to :author, :class_name => 'User'

  def used?
    !Order.find(:first, :conditions => "client_id=#{id} or sender_id=#{id} or receiver_id=#{id}").nil?
  end

  def city
    addr = address2.nil? || address2.empty? ? address1 : address2
    /г.\s*[^,;]+/.match(addr)
  end
end
