class AddAuthorToCar < ActiveRecord::Migration
  def change
    add_column :cars, :author_id, :integer
  end
end
