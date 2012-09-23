class CreateWorkflows < ActiveRecord::Migration
  def change
    create_table :workflows do |t|
      t.integer :current
      t.integer :next

      t.timestamps
    end
  end
end
