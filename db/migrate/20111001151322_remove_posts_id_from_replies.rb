class RemovePostsIdFromReplies < ActiveRecord::Migration
  def self.up
    remove_column :replies, :posts_id
  end

  def self.down
    add_column :replies, :posts_id, :integer
  end
end
