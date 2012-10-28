class WorkflowName < ActiveRecord::Base
  attr_accessible :name, :weight

  def self.title(id)
    WorkflowName.find(id).name
  end
end
