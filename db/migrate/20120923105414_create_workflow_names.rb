class CreateWorkflowNames < ActiveRecord::Migration
  def change
    create_table :workflow_names do |t|
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
