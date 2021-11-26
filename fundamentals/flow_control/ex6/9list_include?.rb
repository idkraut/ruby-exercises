=begin
Problem
  input: an array; and a search value
  output: true if search value is in array
          false otherwise
Examples
  empty arrays should return false
  nil is an acceptable value to search for
      probably false and true as well
Data
  input array
  search value
Algo:
  initialize found flag
  iterate through array
  found flag true if search value found
  return found flag
=end


def include?(array, search_value)
  found = false
  array.each { |value| found = true if value == search_value }
  found
end

def include?(array, value)
  !!array.find_index(value)
end

def include?(array, value)
  array.each { |element| return true if value == element }
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false