class AddPhonesToClients < ActiveRecord::Migration
  def change
    add_column :clients, :phones, :string
  end
end
