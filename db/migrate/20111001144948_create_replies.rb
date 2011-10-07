class CreateReplies < ActiveRecord::Migration
  def self.up
    create_table :replies do |t|
      t.text :response
      t.integer :post_id
      t.integer :user_id

      t.references :post, :user
      t.timestamps
    end
    add_index :replies, [:post_id, :user_id, :created_at]
  end

  def self.down
    drop_table :replies
  end
end
