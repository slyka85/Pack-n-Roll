module ApplicationHelper

  def page_title
    content_for?(:page_title) ? content_for(:page_title) : 'Packing List'
  end

  def google_maps_image_tag(destination, options)
    image_tag("https://maps.googleapis.com/maps/api/staticmap?center=#{destination}&zoom=14&size=300x300", options)
  end

  def current_location_by_ip
  		GeoIp.timeout = 3
  	  @location_request = GeoIp.geolocation('69.121.15.38')
  	  @city = @location_request[:city]
  	  @state = @location_request[:region_name]
  	  @country = @location_request[:country_name]
  	  @location_string = @city+", "+@state+", "+@country
  	  return @location_string
  end

end
