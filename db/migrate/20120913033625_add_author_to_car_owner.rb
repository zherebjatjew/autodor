class AddAuthorToCarOwner < ActiveRecord::Migration
  def change
    add_column :car_owners, :author_id, :integer
  end
end
