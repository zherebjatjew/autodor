class AddAuthorToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :author_id, :integer
  end
end
