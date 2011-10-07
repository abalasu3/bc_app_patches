class CreateVotePosts < ActiveRecord::Migration
  def self.up
    create_table :vote_posts do |t|
      t.integer :count , default => 0
      t.integer :post_id
      t.integer :user_id

      t.references :post, :user
      t.timestamps
    end
    add_index :vote_posts, [:post_id ]
    end

  def self.down
    drop_table :vote_posts
  end
end
