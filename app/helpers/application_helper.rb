module ApplicationHelper
  def format_date(date)
    date.getlocal.strftime("%B %d, %Y at %l:%M %p")
  end
end
