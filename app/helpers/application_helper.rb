module ApplicationHelper
 def title
    base_title = "Live Question App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def logo
    image_tag("logo.png", :alt => "Live Question App", :class => "round")
  end
end
