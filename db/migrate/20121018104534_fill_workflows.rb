#encoding : UTF-8

class FillWorkflows < ActiveRecord::Migration
  def up
    #  1 - 'Новая'
    #  2 - 'Согласована'
    #  3 - 'Авансирована'
    #  4 - 'Погрузка'
    #  5 - 'Доставка'
    #  6 - 'Доставлена'
    #  7 - 'Оплачена'
    #  8 - 'Закрыта'
    #  9 - 'Отменена'
    # 10 - 'Приостановлена'
  
    # Cancel
    Workflow.create! :from_id => 1, :to_id => 9, :admin_only => true
    Workflow.create! :from_id => 2, :to_id => 9, :admin_only => true
    Workflow.create! :from_id => 3, :to_id => 9, :admin_only => true
    Workflow.create! :from_id => 4, :to_id => 9, :admin_only => true
    Workflow.create! :from_id => 5, :to_id => 9, :admin_only => true
    Workflow.create! :from_id => 6, :to_id => 9, :admin_only => true
    Workflow.create! :from_id => 7, :to_id => 9, :admin_only => true

    # Suspend
    Workflow.create! :from_id => 1, :to_id => 10, :admin_only => true
    Workflow.create! :from_id => 2, :to_id => 10, :admin_only => true
    Workflow.create! :from_id => 3, :to_id => 10, :admin_only => true
    Workflow.create! :from_id => 4, :to_id => 10, :admin_only => true
    Workflow.create! :from_id => 5, :to_id => 10, :admin_only => true
    Workflow.create! :from_id => 6, :to_id => 10, :admin_only => true
    Workflow.create! :from_id => 7, :to_id => 10, :admin_only => true

    # Normal workflows
    Workflow.create! :from_id => 1, :to_id => 2
    Workflow.create! :from_id => 2, :to_id => 3
    Workflow.create! :from_id => 2, :to_id => 4
    Workflow.create! :from_id => 3, :to_id => 2
    Workflow.create! :from_id => 3, :to_id => 4
    Workflow.create! :from_id => 4, :to_id => 5
    Workflow.create! :from_id => 5, :to_id => 6
    Workflow.create! :from_id => 6, :to_id => 7
    Workflow.create! :from_id => 7, :to_id => 8

    # Rollbacks
    Workflow.create! :from_id => 2, :to_id => 1
    Workflow.create! :from_id => 3, :to_id => 2
    Workflow.create! :from_id => 5, :to_id => 4
    Workflow.create! :from_id => 6, :to_id => 5
    Workflow.create! :from_id => 7, :to_id => 6
    Workflow.create! :from_id => 8, :to_id => 7

    # Admin corrections (can do anything)
    Workflow.create! :from_id => 9, :to_id => 1, :admin_only => true
    Workflow.create! :from_id => 9, :to_id => 2, :admin_only => true
    Workflow.create! :from_id => 9, :to_id => 3, :admin_only => true
    Workflow.create! :from_id => 9, :to_id => 4, :admin_only => true
    Workflow.create! :from_id => 9, :to_id => 5, :admin_only => true
    Workflow.create! :from_id => 9, :to_id => 6, :admin_only => true
    Workflow.create! :from_id => 9, :to_id => 7, :admin_only => true
    Workflow.create! :from_id => 9, :to_id => 8, :admin_only => true
    Workflow.create! :from_id => 9, :to_id => 8, :admin_only => true
    Workflow.create! :from_id => 9, :to_id => 10, :admin_only => true
    Workflow.create! :from_id => 10, :to_id => 1, :admin_only => true
    Workflow.create! :from_id => 10, :to_id => 2, :admin_only => true
    Workflow.create! :from_id => 10, :to_id => 3, :admin_only => true
    Workflow.create! :from_id => 10, :to_id => 4, :admin_only => true
    Workflow.create! :from_id => 10, :to_id => 5, :admin_only => true
    Workflow.create! :from_id => 10, :to_id => 6, :admin_only => true
    Workflow.create! :from_id => 10, :to_id => 7, :admin_only => true
    Workflow.create! :from_id => 10, :to_id => 8, :admin_only => true
    Workflow.create! :from_id => 10, :to_id => 8, :admin_only => true
    Workflow.create! :from_id => 10, :to_id => 9, :admin_only => true

    # Update existing orders
    Order.all.each do |order|
      order.status_id = 1
      order.status_id = 2 if order.signed
      order.status_id = 7 if order.paid
      order.status_id = 8 if order.completed
      order.update_attribute 'status_id', order.status_id
    end
  end

  def down
    Workflow.delete
  end
end
