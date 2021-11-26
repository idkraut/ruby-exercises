def twice(number)
  digits = number.digits.reverse
  mid_index = digits.size / 2 - 1

  if digits[0..mid_index] == digits[mid_index + 1..-1] && digits.size > 1
    digits.join.to_i
  else
    number * 2
  end
end

# LS
def twice(number)
  string_number = number.to_s
  center = string_number.size / 2
  left_side = center.zero? ? '' : string_number[0..center - 1]
  right_side = string_number[center..-1]

  return number if left_side == right_side
  return number * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10