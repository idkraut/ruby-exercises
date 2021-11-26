hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = 'aeiou'

hsh.each_value do |array|
  array.each do |string|
    string.chars.each { |letter| puts letter if vowels.include?(letter.downcase)}
  end
end

# hsh.each_value do |array|
#   array.each do |string|
#     string.chars.each { |letter| puts letter if ['a', 'e', 'i', 'o', 'u'].include?(letter.downcase)}
#   end
# end