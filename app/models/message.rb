require 'net/http'
require 'uri'
require 'json'

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

  def likeCountURL(url)
    fql = 'SELECT url, share_count, like_count, comment_count, total_count FROM link_stat WHERE url="' + URI.escape(url) + '"' 
    res = Net::HTTP.get_response(URI.parse('http://api.facebook.com/method/fql.query?format=json&query=' + URI.escape(fql)))
    result = JSON.parse(res.body)
    result[0]["like_count"] 
  end
end
