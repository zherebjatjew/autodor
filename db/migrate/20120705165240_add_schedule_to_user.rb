class AddScheduleToUser < ActiveRecord::Migration
  def change
    add_column :users, :schedule, :string
  end
end
