# encoding : UTF-8

class ChangeCargoLoad < ActiveRecord::Migration
  def up
    change_column :cargos, :load, :string
  end

  def down
    change_column :cargos, :load, :boolean
  end
end
