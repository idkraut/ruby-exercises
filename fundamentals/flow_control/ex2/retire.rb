puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

years_to_go = retirement_age - age
current_year = Time.now.year

puts "It is #{current_year}. You will retire in #{current_year + years_to_go}."
puts "You only have #{years_to_go} years of work to go!"