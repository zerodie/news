class AddLikecountToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :like_count, :integer
  end

  def self.down
    remove_column :messages, :like_count
  end
end
