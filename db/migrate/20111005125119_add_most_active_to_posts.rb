class AddMostActiveToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :most_active, :float, :default => 0.0
  end

  def self.down
    remove_column :posts, :most_active
  end
end
