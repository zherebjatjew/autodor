class CreateWorkflowNames < ActiveRecord::Migration
  def change
    create_table :workflow_names do |t|
      t.string :name
      t.integer :weight

      t.timestamps
    end
    WorkflowName.create! :name => 'Новая', :weight => 1
    WorkflowName.create! :name => 'Согласована', :weight => 2
    WorkflowName.create! :name => 'Авансирована', :weight => 3
    WorkflowName.create! :name => 'Погрузка', :weight => 4
    WorkflowName.create! :name => 'Доставка', :weight => 5
    WorkflowName.create! :name => 'Доставлена', :weight => 6
    WorkflowName.create! :name => 'Оплачена', :weight => 7
    WorkflowName.create! :name => 'Закрыта', :weight => 8
    WorkflowName.create! :name => 'Отменена', :weight => 9
    WorkflowName.create! :name => 'Приостановлена', :weight => 10
  end
end
