=begin
Problem:
  input: array
  output: new array, with first element moved to last index
Examples:
  original array is unchanged
  new array is returned
Data:
  input array
  output array
  possibly a storage array?
Algo:
  create a new array
  duplicate and add to new array: elements of original array from index 1 to -1,
  duplicate and add index 0 of input
=end

# def rotate_array(array)
#   rotated = []
#   1.upto(array.size - 1) do |index|
#     rotated << array[index]
#   end
#   rotated << array[0]
#   rotated
# end

# def rotate_array(array)
#   rotated = array.map { |element| element }
#   rotated.push(rotated.shift)
# end

# LS
def rotate_array(array)
  array[1..-1] + [array[0]]
end





p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true
