# def neutralize(sentence)
#   words = sentence.split(' ')
#   words.each do |word|
#     p word
#     words.delete(word) if negative?(word)
#   end
#   p words
#   words.join(' ')
# end

# fix
def neutralize(sentence)
  sentence.split.reject { |word| negative?(word) }.join(' ')
end

# manual implementation of reject!
def mutating_reject(array)
  i = 0
  loop do
    break if i == array.length

    if yield(array[i]) # if array[i] meets the condition checked by the block
      array.delete_at(i)
    else
      i += 1
    end
  end

  array
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

p negative?('boring')

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.