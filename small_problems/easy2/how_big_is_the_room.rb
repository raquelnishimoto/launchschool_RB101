# ask a user for the length and width of a room in meters

puts 'Let\'s calculate an area of the room in both square meters and square feet.'

puts '=> What\'s the length of the room in meters? '
room_length = gets.chomp.to_f

puts '=> What\'s the width of your room? '
room_width = gets.chomp.to_f

room_area_meters = room_length * room_width
room_area_square = (room_length * room_width) * 10.7639

puts "The area of the room is #{room_area_meters} square meters (#{room_area_square.round(2)} square feet)"
