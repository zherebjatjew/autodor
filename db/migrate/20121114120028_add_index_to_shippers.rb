class AddIndexToShippers < ActiveRecord::Migration
  def change
    add_index :shippers, :num, :name => 'idx_shippers_num'
  end
end
