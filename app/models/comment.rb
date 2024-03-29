class Comment < ActiveRecord::Base
  attr_accessible :content, :parent_id
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  has_ancestry
end
