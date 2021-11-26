def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, length)
  digits_array = number.digits.reverse
  digits_array[-length..-1] = rotate_array(digits_array[-length..-1])
  digits_array.join.to_i
end

def max_rotation(number)
  length = number.digits.length
  loop do
    break if length == 0
    number = rotate_rightmost_digits(number, length)
    length -= 1
  end
  number
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845