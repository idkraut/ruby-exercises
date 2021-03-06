=begin
Problem:
  input: an integer
  output: the next 'featured' number
          featured number:
                multiple of 7
                each digit occurs exactly once
                odd
  how to know that there is no next featured number?
    once numbers have 10 digits

  featured exploration
    odd multiples of 7
    7 * 1,
    7 * 3..

Algorithm:
  find the next odd multiple of 7
      increment, return number when multiple of 7 and odd
  find next featured
    add 14
    return number if digits.uniq == digits
    return error if number > 9_999_999_999


=end

def next_odd_7(number)
  loop do
    number += 1
    return number if number % 7 == 0 && number.odd?
  end
end

def featured(number)
  number = next_odd_7(number)

  loop do
    return number if number.digits.uniq == number.digits
    break "No possible number" if number >= 9_876_543_210
    number += 14
  end
end

# LS
def featured(number)
  number += 1
  number += 1 until number.odd? && number % 7 == 0

  loop do
    number_chars = number.to_s.split('')
    return number if number_chars.uniq == number_chars
    number += 14
    break if number >= 9_876_543_210
  end

  'There is no possible number that fulfills those requirements.'
end



p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements