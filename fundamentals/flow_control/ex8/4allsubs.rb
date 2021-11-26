def leading_substrings(string)
  substrings = []
  1.upto(string.length) do |sub_length|
    substrings << string[0, sub_length] # or string[0..sub_length - 1]
  end
  substrings
end

# doesn't work because delete removes all instances
def substrings(string)
  all_subs = []
  length = string.length
  length.times do
    all_subs << leading_substrings(string)
    string.delete!(string[0])
  end
  p all_subs.flatten
end

# LS
def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(leading_substrings(this_substring))
  end
  results
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]