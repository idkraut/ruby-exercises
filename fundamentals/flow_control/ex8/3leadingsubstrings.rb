def leading_substrings(string)
  substrings = []
  1.upto(string.length) do |sub_length|
    substrings << string[0, sub_length] # or string[0..sub_length - 1]
  end
  substrings
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
