class Guestlist < ActiveRecord::Base
  attr_accessible :event_id, :viewer_id

  belongs_to :event
  belongs_to :viewer, class_name: "User"

  validates :event_id, presence: true
  validates :viewer_id, presence: true
end
