# encoding: UTF-8

class Client < ActiveRecord::Base
  attr_accessible :address1, :address2, :faxes, :inn, :kpp, :account, :corr_account, :ati, :bic, :born_at, :contact,
                  :identity, :name, :note, :organization, :schedule, :phones, :email, :director, :num

  belongs_to :author, :class_name => 'User'

  def used?
    !Order.find_by_client_id(id).nil? ||
    !Cargo.where("sender_id=#{id} OR receiver_id=#{id}").first().nil?
  end

  def city
    addr = address2.nil? || address2.empty? ? address1 : address2
    /г.\s*[^,;]+/.match(addr)
  end

  def identifier
    num == 0 ? id : num
  end
end
