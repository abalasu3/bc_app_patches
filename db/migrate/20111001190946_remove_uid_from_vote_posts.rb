class RemoveUidFromVotePosts < ActiveRecord::Migration
  def self.up
    remove_column :vote_posts, :uid
  end

  def self.down
    add_column :vote_posts, :uid, :integer
  end
end
