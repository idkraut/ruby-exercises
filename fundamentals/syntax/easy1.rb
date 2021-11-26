# advice = "Few things in life are as important as house training your pet dinosaur."

# puts advice.gsub!('important', 'urgent')

# ------------------------
# puts 42.between?(10, 100)
# (10..100).cover?(42)
# ------------------------

# famous_words = "seven years ago..."
# four_score = "Four score and "

# # puts four_score << famous_words
# # puts four_score.concat(famous_words)
# puts "Four score and " + famous_words
# ------------------------

# p ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]].flatten!
# ------------------------

# flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# arr = [] 
# flintstones.each do |k, v|
#   if k == "Barney"
#     arr << k
#     arr << v
#   end
# end
# p arr

p flintstones.assoc("Barney")