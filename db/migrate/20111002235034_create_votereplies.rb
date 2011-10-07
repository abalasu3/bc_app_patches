class CreateVotereplies < ActiveRecord::Migration
  def self.up
    create_table :votereplies do |t|
      t.integer :rcount
      t.integer :reply_id
      t.integer :user_id

      t.references :reply, :user

      t.timestamps
    end
    add_index :votereplies, [:reply_id]
  end

  def self.down
    drop_table :votereplies
  end
end
