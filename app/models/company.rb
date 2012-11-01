class Company < ActiveRecord::Base
  attr_accessible :account, :address1, :address2, :ati, :bic, :born_at, :corr_account, :director, :email, :faxes, :identity, :inn, :kpp, :name, :phones, :schedule, :director_short, :contact

  def self.instance
    Company.first
  end
end
