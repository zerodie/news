class Message < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :url, :scope => :content
  validates_presence_of :content, :unless => has_url?
  
  def has_url?
    url
  end
end
