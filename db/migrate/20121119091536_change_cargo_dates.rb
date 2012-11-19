class ChangeCargoDates < ActiveRecord::Migration
  def up
    change_column :cargos, :sender_date, :datetime
    change_column :cargos, :receiver_date, :datetime
  end

  def down
    change_column :cargos, :sender_date, :date
    change_column :cargos, :receiver_date, :date
  end
end
