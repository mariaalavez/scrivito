module ApplicationHelper

  def format_date(date)
    date.try(:strftime, '%b %d, %Y')
  end
end
