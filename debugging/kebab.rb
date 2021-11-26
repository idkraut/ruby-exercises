ALPHABET = ("a".."z").to_a + ("A".."Z").to_a
UPPER = ("A".."Z").to_a

# def kebabize(string)
#   string = string.chars.select { |char| ALPHABET.include?(char) }.join

#   words = []
#   current_word = ''
#   (0...string.length).each do |idx|
#      if UPPER.include?(string[idx])
#       words << current_word
#       current_word = ''
#     end
#     current_word << string[idx]
#   end
#   words << current_word
#
#   words.map! { |word| word.downcase }
#   words.join('-')
# end

def kebabize(string)
  string = string.chars.select { |char| ALPHABET.include?(char) }.join

  words = []
  current_word = ''
  string.each_char do |char|
    if UPPER.include?(char)
      words << current_word
      current_word = ''
    end
    current_word << char
  end
  words << current_word

  words.join('-').downcase
end

p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'