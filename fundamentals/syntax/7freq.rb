statement = "The Flintstones Rock"
letters = statement.chars
letters_count = Hash.new(0)
letters.each { |letter| letters_count[letter] += 1}

# result = {}
# letters = ('A'..'Z').to_a + ('a'..'z').to_a
# letters.each do |letter|
#   letter_frequency = statement.scan(letter).count
#   result[letter] = letter_frequency if letter_frequency > 0
# end

# letters_count = {}
# letters.each do |letter|
#   if letters_count.include?(letter)
#     letters_count[letter] += 1
#   else
#     letters_count[letter] = 1
#   end
# end


p letters_count