json.array!(@trips) do |trip|
  json.extract! trip, :id, :destination
  json.start trip.start_date
  json.end trip.end_date
  json.color @color
  json.url trip_url(trip, format: :html)
end