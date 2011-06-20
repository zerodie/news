module ApplicationHelper
  def title
    if @num.nil?
	  "TW Hacker News"
	else
	  "#{@message.title}"
	end
  end
end
