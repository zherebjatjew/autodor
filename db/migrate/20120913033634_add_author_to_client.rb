class AddAuthorToClient < ActiveRecord::Migration
  def change
    add_column :clients, :author_id, :integer
  end
end
