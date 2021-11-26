def leading_substrings(string)
  substrings = []
  1.upto(string.length) do |sub_length|
    substrings << string[0, sub_length] # or string[0..sub_length - 1]
  end
  substrings
end

def substrings(string)
  all_subs = []
  length = string.length
  length.times do
    all_subs << leading_substrings(string)
    string[0] = ''
  end
  all_subs.flatten
end

# LS
# def substrings(string)
#   results = []
#   (0...string.size).each do |start_index|
#     this_substring = string[start_index..-1]
#     results.concat(leading_substrings(this_substring))
#   end
#   results
# end

def palindromes(string)
  result = []
  substrings(string).each do |substring|
    result << substring if substring.size > 1 && substring == substring.reverse
  end
  result
end

# LS
def palindromes(string)
  all_substrings = substrings(string)
  results = []
  all_substrings.each do |substring|
    results << substring if palindrome?(substring)
  end
  results
end

def palindrome?(string)
  string == string.reverse && string.size > 1
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]