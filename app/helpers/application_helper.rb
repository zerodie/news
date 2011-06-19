module ApplicationHelper
  def title
    if @page.nil?
	  "TW Hacker News"
	else
	  "#{@message.title} - TWHN"
  end
  
  def url
    base_url = "http://twhackernews.heroku.com/"
    if @page.nil?
	  base_url
	else
	  "#{base_url}messages/#{@page}"
  end
end
