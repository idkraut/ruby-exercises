# Write a method that takes a string as argument, and returns true
# if all parentheses in the string are properly balanced, false otherwise.
# To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

=begin
Problem
  input: a string, contains some number of parentheses, can be zero
  output: true or false
            true if all parens are balanced, false if not
  if zero parens, then true
  if uneven count, then false
  even count doesn't necessarily mean true

  unbalanced conditions
     right parens: if you find ')' and ) count is great than ( count
     left parens:
    end

Algorithm
    initialize hash to keep track of '(' and ')'
    iterate through chars in string
    if '(' add to '(' count
    if ')/ check '(' count
      add 1 to right count
      return false if right count greater than left count
    end
    return false if counts aren't equal
    return true
=end

def balanced?(string)
  paren_count = { '(' => 0, ')' => 0 }

  string.chars.each do |char|
    if char == '('
      paren_count[char] += 1
    elsif char == ')'
      paren_count[char] += 1
      return false if paren_count['('] < paren_count[')']
    end
  end
  return false if paren_count['('] != paren_count[')']
  return true
end

# LS
def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end


p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false