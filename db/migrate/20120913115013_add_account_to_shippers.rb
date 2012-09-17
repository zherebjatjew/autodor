class AddAccountToShippers < ActiveRecord::Migration
  def change
    add_column :shippers, :account, :string
  end
end
