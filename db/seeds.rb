puts "Clearing DB!"

User.destroy_all
User.create(first_name: "inou", last_name: "ridder", email: 'a@a.a', password: 'password')
User.create(first_name: "irvin", last_name: "hoogland", email: 'b@b.b', password: 'password')

sample_image_urls =
["https://images.pexels.com/photos/1288482/pexels-photo-1288482.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/101808/pexels-photo-101808.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/313691/pexels-photo-313691.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/32870/pexels-photo.jpg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/87223/pexels-photo-87223.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/681368/pexels-photo-681368.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/534151/pexels-photo-534151.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/462358/pexels-photo-462358.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/870902/pexels-photo-870902.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/534182/pexels-photo-534182.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/1030555/pexels-photo-1030555.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/681333/pexels-photo-681333.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/33343/building-joy-planning-plans.jpg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/210617/pexels-photo-210617.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/12619/house-money-capitalism-fortune-12619.jpg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/280222/pexels-photo-280222.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/259950/pexels-photo-259950.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/955793/pexels-photo-955793.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/280492/pexels-photo-280492.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/164516/pexels-photo-164516.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/36362/pexels-photo.jpg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/259098/pexels-photo-259098.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/1080696/pexels-photo-1080696.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/681327/pexels-photo-681327.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/966397/pexels-photo-966397.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/280221/pexels-photo-280221.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/271699/pexels-photo-271699.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/210463/pexels-photo-210463.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/681390/pexels-photo-681390.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/126271/pexels-photo-126271.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/396303/pexels-photo-396303.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/6343/village-hotel-building-countryside-6343.jpg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/681335/pexels-photo-681335.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/164522/pexels-photo-164522.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/534220/pexels-photo-534220.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/271689/pexels-photo-271689.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/280229/pexels-photo-280229.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/461024/pexels-photo-461024.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/415687/pexels-photo-415687.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/280232/pexels-photo-280232.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/1234462/pexels-photo-1234462.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/276554/pexels-photo-276554.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/681361/pexels-photo-681361.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/276514/pexels-photo-276514.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/65781/pexels-photo-65781.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/53610/large-home-residential-house-architecture-53610.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/434657/pexels-photo-434657.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/259957/pexels-photo-259957.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/417292/pexels-photo-417292.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/277667/pexels-photo-277667.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/1054974/pexels-photo-1054974.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/1368687/pexels-photo-1368687.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/388830/pexels-photo-388830.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/7174/summer-grass.jpg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/221024/pexels-photo-221024.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/259588/pexels-photo-259588.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/271713/pexels-photo-271713.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/259820/pexels-photo-259820.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/816198/pexels-photo-816198.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/531450/pexels-photo-531450.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/164539/pexels-photo-164539.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/140963/pexels-photo-140963.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/533416/pexels-photo-533416.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/534228/pexels-photo-534228.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/209315/pexels-photo-209315.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/209266/pexels-photo-209266.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/1029172/pexels-photo-1029172.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/262464/pexels-photo-262464.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/118009/pexels-photo-118009.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/439352/pexels-photo-439352.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/534184/pexels-photo-534184.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/221540/pexels-photo-221540.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/462180/pexels-photo-462180.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/439404/pexels-photo-439404.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/347141/pexels-photo-347141.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/139115/pexels-photo-139115.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/139111/pexels-photo-139111.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/1240435/pexels-photo-1240435.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/130852/pexels-photo-130852.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/210538/pexels-photo-210538.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/191323/pexels-photo-191323.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/363889/pexels-photo-363889.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/259597/pexels-photo-259597.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/425047/pexels-photo-425047.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/1212053/pexels-photo-1212053.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/109572/pexels-photo-109572.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/439416/pexels-photo-439416.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/534233/pexels-photo-534233.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/41170/architecture-blue-building-business-41170.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/208736/pexels-photo-208736.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/398638/pexels-photo-398638.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/571163/pexels-photo-571163.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/323776/pexels-photo-323776.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/1105754/pexels-photo-1105754.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/259593/pexels-photo-259593.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/1322964/pexels-photo-1322964.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/1029599/pexels-photo-1029599.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/140511/pexels-photo-140511.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/209292/pexels-photo-209292.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/220820/pexels-photo-220820.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/783745/pexels-photo-783745.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/323774/pexels-photo-323774.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/144632/pexels-photo-144632.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/1321730/pexels-photo-1321730.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/987550/pexels-photo-987550.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/1562/italian-landscape-mountains-nature.jpg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/314937/pexels-photo-314937.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/242246/pexels-photo-242246.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/950745/pexels-photo-950745.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/534124/pexels-photo-534124.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/273683/pexels-photo-273683.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/981916/pexels-photo-981916.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/448605/pexels-photo-448605.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/562199/pexels-photo-562199.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/396304/pexels-photo-396304.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/462205/pexels-photo-462205.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/1233263/pexels-photo-1233263.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/803975/pexels-photo-803975.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/339996/pexels-photo-339996.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/210602/pexels-photo-210602.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/263399/pexels-photo-263399.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/463996/pexels-photo-463996.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/439392/pexels-photo-439392.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/266812/pexels-photo-266812.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/323781/pexels-photo-323781.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/158148/ruhl-house-home-galveston-texas-158148.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/242258/pexels-photo-242258.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/129494/pexels-photo-129494.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/510532/pexels-photo-510532.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/63743/pexels-photo-63743.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/977739/pexels-photo-977739.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/187815/pexels-photo-187815.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/111949/pexels-photo-111949.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/258184/pexels-photo-258184.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/104367/pexels-photo-104367.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/208732/pexels-photo-208732.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/137083/pexels-photo-137083.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/427649/pexels-photo-427649.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/373508/pexels-photo-373508.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/1320734/pexels-photo-1320734.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/83499/pexels-photo-83499.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/166669/pexels-photo-166669.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/376547/pexels-photo-376547.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/1200253/pexels-photo-1200253.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/1862/summer-sunshine-alcohol-drink.jpg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/449023/pexels-photo-449023.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/277653/pexels-photo-277653.jpeg?auto=compress&cs=tinysrgb&h=350",
 "https://images.pexels.com/photos/260994/pexels-photo-260994.jpeg?auto=compress&cs=tinysrgb&h=350"]


puts "Destroying all properties"
SpaceProperty.destroy_all
Property.destroy_all
puts "Creating properties"

features = %w(Bathtub Cyclorama Deck Elevator Exposed-Brick Fire-Pit Fireplace Gazebo Green-Screen Grill Kitchen Library Lounge Patio Piano Pool)
space_types = %w(Auditorium Ballroom Banquet Hall Bar Boardroom Cabin Cafe Church Classroom Club Dance Studio Film Studio Fitness Studio Gallery Garage Garden Gym Hotel House Loft Mansion Office Outdoor Palace Party Hall Photo-Studio Ranch Recording-Studio Restaurant Rooftop Sound Stage Storefront Theater Video Studio Villa Warehouse Yoga Studio)
activity_types = ["Corporate Event", "Dinner", "Film Shoot", "Fitness Class", "Meeting","Networking","Party","Performance","Photo Shoot","Pop-Up","Retreat","Wedding","Workshop"]
cities = %w(Amsterdam Delft Haarlem Utrecht Amstelveen Berlin Barcelona Madrid Taragona Potsdam Oranienburg Leipzig Magdeburg Sabadell Terrassa)

opening_times = ["10:00", "12:00", "14:00"]
closing_times = ["18:00", "20:00", "23:00"]
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
  space = Space.create({
    title: Faker::Artist.name,
    address: Faker::Address.full_address,
    user: User.all.sample,
    capacity: rand(50),
    price_per_hour: price_hour,
    price_per_day: price_hour * 8,
    address: cities.sample,
    description: Faker::Lorem.paragraph,
    opens: Time.parse(opening_times.sample),
    closes: Time.parse(closing_times.sample),
    minimum_booking_hours: rand(4)
    })
  Property.all.sample(rand(18)).each do |prop|
    SpaceProperty.create({
      space: space,
      property: prop,
      quantity: prop.quantifiable? ? rand(3) : nil
    })
  end
  3.times do
    sa = SpaceAttachment.new(space: space)
    sa.remote_photo_url = sample_image_urls.sample
    sa.save
  end
  puts space.title + " " + "created!"
end

puts "Bye!"













