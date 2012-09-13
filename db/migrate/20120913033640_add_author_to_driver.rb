class AddAuthorToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :author_id, :integer
  end
end
