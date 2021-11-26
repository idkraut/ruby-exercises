# def swap(string)
#   string.split.each do |word|
#     first = word[0]
#     word[0] = word[-1]
#     word[-1] = first
#   end.join(' ')
# end

# def swap(string)
#   result = string.split.map do |word|
#     first = word[0]
#     word[0] = word[-1]
#     word[-1] = first
#     word
#   end
#   result.join(' ')
# end

def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end

p swap('hello there')