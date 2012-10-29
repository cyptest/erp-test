module ApplicationHelper
  # Return a title on a per-page basis.
  def title
    base_title = "Mini ERP"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("logo.png", :alt => "Mini ERP", :class => "round")
  end	
end
