json.array!(@trips) do |trip|
	  json.extract! trip, :id, :destination, :user_id
	  json.title trip.destination
	  json.start trip.start_date
	  json.end trip.end_date
	  json.color @colors_array.sample
	  json.url trip_url(trip, format: :html)
end