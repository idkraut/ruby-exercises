def repeater(string)
  doubled_string = ''
  string.chars.each { |char| doubled_string << char * 2}
  p doubled_string
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''