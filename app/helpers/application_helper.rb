module ApplicationHelper
  def returntitle
    if @num.nil?
	  "TW Hacker News"
	else
	  "#{@message.title}"
	end
  end
end
