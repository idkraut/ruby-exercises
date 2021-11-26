# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# puts ages.include?("Spot")

# ------------------------

# munsters_description = "The Munsters are creepy in a good way."
# puts munsters_description.upcase
# puts munsters_description.downcase
# puts munsters_description.capitalize
# puts munsters_description.swapcase

# ------------------------

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
# additional_ages = { "Marilyn" => 22, "Spot" => 237 }

# ages.merge!(additional_ages)
# puts ages

# ------------------------

# advice = "Few things in life are as important as house training your pet dinosaur."
# # puts advice.include?("life")
# puts advice.match?("Dino")

# ------------------------

# p flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# flintstones.push("Dino", "Happy")
# flintstones.insert(2, "Dino", "Happy")
# p flintstones

# ------------------------

# advice = "Few things in life are as important as house training your pet dinosaur."
# p advice.slice!("Few things in life are as important as ")
# p advice

# ------------------------
# statement = "The Flintstones Rock!"
# p statement.count('t')

# ------------------------
title = "Flintstone Family Members"
p title.center(40)