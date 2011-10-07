class Votereply < ActiveRecord::Base
  belongs_to :reply, :counter_cache => true
  belongs_to :user
  attr_accessible :user_id, :reply_id, :rcount

  after_initialize :init

  def init
      self.rcount = 0 if self.rcount.nil?
  end
end
