class RemovePidFromVotePosts < ActiveRecord::Migration
  def self.up
    remove_column :vote_posts, :pid
  end

  def self.down
    add_column :vote_posts, :pid, :integer
  end
end
