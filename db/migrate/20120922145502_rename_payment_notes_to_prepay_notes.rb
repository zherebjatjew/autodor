class RenamePaymentNotesToPrepayNotes < ActiveRecord::Migration
  def change
    rename_column :cargos, :payment_notes, :tcharge_notes
  end
end
