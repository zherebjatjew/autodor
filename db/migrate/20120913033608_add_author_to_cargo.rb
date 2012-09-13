class AddAuthorToCargo < ActiveRecord::Migration
  def change
    add_column :cargos, :author_id, :integer
  end
end
