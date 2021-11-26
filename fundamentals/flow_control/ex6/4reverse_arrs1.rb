=begin
Problem
  input: an array; no specified type of element
  output: the same array, with elements in reverse order
Data:
  array
Algo:
  initialize an empty array
  initialize counter to 0
    while index < arr length
    pop from input array into empty array
    increment counter
  append all elements from empty array into input array
=end

# def reverse!(array)
#   # return array if array.size == 0
#   reversed_elements = []
#   counter = 0
#   length = array.length
#   loop do
#     break if counter == length
#     reversed_elements << array.pop
#     counter += 1
#     # p reversed_elements
#   end
#   reversed_elements.each { |element| array << element }
#   array
# end

def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true