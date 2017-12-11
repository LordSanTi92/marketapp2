module ApplicationHelper
  def title(page_title = "")
    base_title = "MarketplaceApp"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
