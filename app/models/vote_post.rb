class VotePost < ActiveRecord::Base
  belongs_to :post, :counter_cache => true
  belongs_to :user
  attr_accessible :user_id, :post_id, :count

  after_initialize :init

  def init
      self.count = 0 if self.count.nil?
  end
end
