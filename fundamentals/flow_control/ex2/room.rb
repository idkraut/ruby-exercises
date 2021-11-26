SQMETERS_TO_SQFEET = 10.7639


puts "What's the length in meters?"
meters_length = gets.chomp.to_f
puts "What's the width in meters?"
meters_width = gets.chomp.to_f

square_meters = meters_length * meters_width.round(2)
square_feet = (square_meters * SQMETERS_TO_SQFEET).round(2)

puts "The area of the room is #{square_meters} square meters (#{square_feet} feet)"

