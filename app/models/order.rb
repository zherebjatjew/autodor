class Order < ActiveRecord::Base
  attr_accessible :info
  belongs_to :user
  validates :user_id, :presence => true
end
