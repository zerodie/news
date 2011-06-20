module ApplicationHelper
  def metatitle
    if @num.nil?
	  "TW Hacker News"
	else
	  "#{@metat}"
	end
  end
end
