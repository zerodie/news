module ApplicationHelper
  def metatitle
    if @num.nil?
	  "TW Hacker News"
	else
	  "#{@num}"
	end
  end
end
