# json.array! @spaces do |space|
#   json.body space.partial_to_string
#   json.coordinates lat: space.latitude, lng: space.longitude
#   json.infoWindow content: space.partial_map_box
# end
# rendering the JSON object in controller to use render collection speed
