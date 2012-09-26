class RenameClientAddress < ActiveRecord::Migration
  def change
    rename_column :clients, :address, :address1
  end

  def down
  end
end
