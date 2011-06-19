class Message < ActiveRecord::Base
belongs_to :user
validates_uniqueness_of :url, :scope => :content
validates_presence_of :content, :unless => :has_url? #validate_presence_of :content if no url

def has_url?
if self.url == ""
false
else
true
end
end
end
