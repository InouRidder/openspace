json.array! @spaces do |space|
  json.body space.partial_to_string
  json.coordinates lat: space.latitude, lng: space.longitude
  json.infoWindow content: space.partial_title
end
