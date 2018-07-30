json.array! @spaces do |space|
  json.body space.html_to_string
end
