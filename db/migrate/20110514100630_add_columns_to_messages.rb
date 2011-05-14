class AddColumnsToMessages < ActiveRecord::Migration
  def self.up
     add_column :messages, :user_id, :integer
     add_column :messages, :title, :string
     add_column :messages, :url, :string
     add_column :messages, :content, :text
  end

  def self.down
    remove_column :messages, :user_id
    remove_column :messages, :title
    remove_column :messages, :url
    remove_column :messages, :content
  end
end
