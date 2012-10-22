class Workflow < ActiveRecord::Base
  attr_accessible :admin_only, :from_id, :to_id

  has_many :alternatives, :class_name => 'Workflow', :foreign_key => 'from_id'
  has_many :rollbacks, :class_name => 'Worflow', :foreign_key => 'to_id'

  def self.allowed(status, is_admin = false)
    if is_admin
      f = Workflow.where('from_id = ?', status)
    else
      f = Workflow.where('admin_only = 0 AND from_id = ?', status)
    end
    res = []
    f.each { |item| res << item.to_id }
    res
  end
end
