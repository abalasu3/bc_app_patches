class AddRepcountToReplies < ActiveRecord::Migration
  def self.up
    add_column :replies, :repcount, :integer, :default => 0
    Votereply.reset_column_information
    Votereply.find (:all).each do |t|
      Votereply.update_counters r.id, :repcount => r.rcount
    end
   end

  def self.down
    remove_column :replies, :repcount
  end
end
