class AddConclusionToClient < ActiveRecord::Migration
  def change
    add_column :clients, :signed_at, :date
    add_column :clients, :address2, :string, :default => ''
    add_column :clients, :inn, :string
    add_column :clients, :kpp, :string
    add_column :clients, :account, :string
    add_column :clients, :ati, :string
    add_column :clients, :corr_account, :string
    add_column :clients, :bic, :string
    add_column :clients, :faxes, :string
    add_column :clients, :email, :string
  end
end
