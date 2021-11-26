=begin
Problem:
  input: a number
          number of n rightmost digits to rotate
  output: a number with n digits rotated
Examples:
  if n is 1, no change
    n is 2, last 2 digits swapped
    rotation continues
      nth digit from the right will be last digit
  what if n is greater than number of digits?
    just rotate whole number? start over at 1?
Data:
    array of digits
    sub array passed into rotate method
    n determining length
Algo:
    create digits array, reversed
    reassign last n elements to result of last n elements passed to rotate method
    0 - n is first index, up to -1
=end


def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, length)
  digits_array = number.digits.reverse
  digits_array[0 - length..-1] = rotate_array(digits_array[0 - length..-1])
  digits_array.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
