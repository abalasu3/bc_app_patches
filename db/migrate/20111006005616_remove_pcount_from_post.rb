class RemovePcountFromPost < ActiveRecord::Migration
  def self.up
    remove_column :posts, :pcount
  end

  def self.down
    add_column :posts, :pcount, :integer
  end
end
