puts "Clearing DB!"

User.destroy_all
User.create(email: 'a@a.a', password: 'password')
User.create(email: 'b@b.b', password: 'password')


puts "Destroying all properties"
SpaceProperty.destroy_all
Property.destroy_all
puts "Creating properties"

features = %w(Bathtub Cyclorama Deck Elevator Exposed-Brick Fire-Pit Fireplace Gazebo Green-Screen Grill Kitchen Library Lounge Patio Piano Pool)
space_types = %w(Auditorium Ballroom Banquet Hall Bar Boardroom Cabin Cafe Church Classroom Club Dance Studio Film Studio Fitness Studio Gallery Garage Garden Gym Hotel House Loft Mansion Office Outdoor Palace Party Hall Photo-Studio Ranch Recording-Studio Restaurant Rooftop Sound Stage Storefront Theater Video Studio Villa Warehouse Yoga Studio)
activity_types = ["Corporate Event", "Dinner", "Film Shoot", "Fitness Class", "Meeting","Networking","Party","Performance","Photo Shoot","Pop-Up","Retreat","Wedding","Workshop"]
cities = %w(Amsterdam Delft Haarlem Utrecht Amstelveen Berlin Barcelona Madrid Taragona Potsdam Oranienburg Leipzig Magdeburg Sabadell Terrassa)

features.each do |feature|
  Property.create(content: feature, kind: 'feature', quantifiable: true)
end

space_types.each do |space_type|
  Property.create(content: space_type, kind: 'space_type', quantifiable: false)
end

activity_types.each do |activity_type|
  Property.create(content: activity_type, kind: 'activity_type', quantifiable: false)
end

puts "Destroying all spaces"

Space.destroy_all
puts "Creating spaces"
50.times do
  price_hour = rand(100)
  space = Space.create(title: Faker::Artist.name, address: Faker::Address.full_address, user: User.all.sample, capacity: rand(50), price_per_hour: price_hour, price_per_day: price_hour * 8, address: cities.sample, description: Faker::Lorem.paragraph)
  Property.all.sample(rand(18)).each do |prop|
    SpaceProperty.create(space: space, property: prop, quantity: prop.quantifiable? ? rand(3) : nil)
  end
  puts space.title + " " + "created!"
end

puts "Bye!"
