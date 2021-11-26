CONSONANTS = ("A".."Z").to_a + ("a".."z").to_a - %w[a e i o u] - %w[A E I O U]
# CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

p CONSONANTS

def double_consonants(string)
  result = ''
  string.each_char do |char|
    if CONSONANTS.include? char
      result << char * 2
    else
      result << char
    end
  end
  p result
end

# LS
def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  p result
end



p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

