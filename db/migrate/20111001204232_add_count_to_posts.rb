class AddCountToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :count, :integer, :default => 0
    VotePost.reset_column_information
    VotePost.find (:all).each do |t|
    VotePost.update_counters t.id, :count => t.count
    VotePost.update_counters t.id, :user_id => t.user_id

    end
  end

  def self.down
    remove_column :posts, :count
  end
end
