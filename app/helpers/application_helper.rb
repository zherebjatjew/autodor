module ApplicationHelper
  def title
    base_title = "Автодор"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def logo
    l = image_tag("logo.png", :alt => "Logo", :class => "round")
    link_to l, root_path
  end
end
