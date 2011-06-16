module ApplicationHelper
	def url
      base_url = "http://twhackernews.heroku.com/"
      if @page.nil?
        base_url
      else
        "#{base_url}messages/#{@page}"
      end
    end
end
