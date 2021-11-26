# def word_sizes(string)
#   words_array = string.split
#   word_length_counts = Hash.new(0)
#   words_array.each do |word|
#     word_length = word.size
#     word_length_counts[word_length] += 1
#   end
#   word_length_counts
# end

# def word_sizes(words_string)
#   counts = Hash.new(0)
#   words_string.split.each { |word| counts[word.size] += 1 }
#   counts
# end
require 'pry'

ALPHABETIC_CHARS = ("a".."z")

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    count = word.count("A-Za-z")
    counts[count] += 1
  end
  counts
end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') == {}

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}