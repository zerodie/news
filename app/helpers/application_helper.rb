
#require 'net/http'
#require 'uri'
#require 'json'

module ApplicationHelper
  #def likeCountURL(inurl)
  #  url = inurl 
  #  fql = 'SELECT url, share_count, like_count, comment_count, total_count FROM link_stat WHERE url="' + URI.escape(url) + '"' 
  #  res = Net::HTTP.get_response(URI.parse('http://api.facebook.com/method/fql.query?format=json&query=' + URI.escape(fql)))
  #  result = JSON.parse(res.body)
  #  result[0]["share_count"] 
  #end
end
