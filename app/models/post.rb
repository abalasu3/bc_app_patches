class Post < ActiveRecord::Base
  belongs_to :user
  has_many :replies
  has_many :vote_posts
  attr_accessible :content, :title, :user_id, :count, :most_active
  default_scope :order => 'posts.most_active DESC'
  validates :title, :presence => true
  validates :content, :presence => true
  validates_uniqueness_of :user_id, :scope => "id"

    def self.search(search)
    if search
     find(:all, :conditions => ['content LIKE ?',"%#{search}%"])
    else
     find(:all)
    end
  end
end
