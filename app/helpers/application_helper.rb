module ApplicationHelper
  def title
    if @title.nil?
      "SignIn, an unknown Page"
    else
       "SignIn, the #{@title} Page"
    end
  end
  def logo
    image_tag("logo.png", :alt => "Sample App", :class => "round")
  end
end
