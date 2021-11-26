def crunch(string)
  clean_string = ''
  string.each_char do |char|
    clean_string << char unless clean_string[-1] == char
  end
  clean_string
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''