module ApplicationHelper

  def page_title
    content_for?(:page_title) ? content_for(:page_title) : 'Packing List'
  end

  def google_maps_image_tag(destination, options)
    image_tag("https://maps.googleapis.com/maps/api/staticmap?center=#{destination}&zoom=14&size=300x300", options)
  end
end
