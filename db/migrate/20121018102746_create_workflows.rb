class CreateWorkflows < ActiveRecord::Migration
  def change
    create_table :workflows do |t|
      t.integer :from_id
      t.integer :to_id
      t.boolean :admin_only, :default => false

      t.timestamps
    end
    add_index :workflows, :from_id
    add_index :workflows, :to_id
  end
end
