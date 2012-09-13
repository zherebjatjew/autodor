class AddAuthorToUser < ActiveRecord::Migration
  def change
    add_column :users, :author_id, :integer
  end
end
