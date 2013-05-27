class Event < ActiveRecord::Base
  attr_accessible :title, :tagline, :description, :when, :price, :paid, :url
  has_one :host, class_name: "User"
  has_many :guestlists, dependent: :destroy
  has_many :viewers, through: :guestlists, source: :viewer

  validates :title, presence: true
  # validates :tagline, presence: true
  # validates :when, presence: true

  def add_viewer!(viewer)
  	guestlists.create!(viewer_id: viewer.id)
  end

  def remove_viewer!(viewer)
  	guestlists.find_by_viewer_id(viewer.id).destroy
  end

end
