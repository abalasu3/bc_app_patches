class Reply < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :votereplies
  attr_accessible :response
  attr_accessible :post_id, :user_id, :repcount
   default_scope :order => 'replies.created_at DESC'
end
