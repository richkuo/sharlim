class Charge < ActiveRecord::Base
  attr_accessible :user_id, :event_id, :amount
  belongs_to :users
end
