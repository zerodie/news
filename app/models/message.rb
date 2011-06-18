require 'net/http'
require 'uri'
require 'json'

class Message < ActiveRecord::Base
  belongs_to :user
  validates_uniqueness_of :url
  
  def get_like_count newsid
    url = 'http://twhackernews.heroku.com/messages/' + newsid.to_s
    fql = 'SELECT url, share_count, like_count, comment_count, total_count FROM link_stat WHERE url="' + URI.escape(url) + '"' 
    #puts 'http://api.facebook.com/method/fql.query?format=json&query=' + URI.escape(fql)
    res = Net::HTTP.get_response(URI.parse('http://api.facebook.com/method/fql.query?format=json&query=' + URI.escape(fql)))
    result = JSON.parse(res.body)
    result[0]["like_count"]
  end
  
end
