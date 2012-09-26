class AddSeatToCargo < ActiveRecord::Migration
  def change
    add_column :cargos, :seat, :integer
  end
end
