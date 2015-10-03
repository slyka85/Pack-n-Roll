module ApplicationHelper

  def page_title
    content_for?(:page_title) ? content_for(:page_title) : 'Packing List'
  end

  def google_maps_image_tag(destination, options)
    image_tag("https://maps.googleapis.com/maps/api/staticmap?center=#{destination}&zoom=14&size=300x300", options)
  end

  # def current_location_by_ip
  # 		GeoIp.timeout = 10
  # 	  @location_request = GeoIp.geolocation(request.remote_ip)
  # 	  @city = @location_request[:city]
  # 	  @state = @location_request[:region_name]
  # 	  @country = @location_request[:country_name]
  # 	  @location_string = @city+", "+@state+", "+@country
  # 	  return @location_string
  # end

  def location_with_geocoder
  	@result = request.location
  	@city = @result.data["city"]
  	@state = @result.data["region_name"]
  	@country = @result.data["country_name"]
  	@full_location = @city+", "+@state+", "+@country
  	return @full_location
  end

end
