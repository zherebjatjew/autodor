class AddNotesToCargos < ActiveRecord::Migration
  def change
    add_column :cargos, :icharge_notes, :string, :default => ''
    add_column :cargos, :prepay_notes, :string, :default => ''
  end
end
