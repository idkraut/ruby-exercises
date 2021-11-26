def digit_list(int)
  int.digits.reverse
  # int.to_s.split('').map { |x| x.to_i }
end

p digit_list(904)
---------------
# Brute force
# def digit_list(number)
#   digits = []
#   loop do
#     number, remainder = number.divmod(10)
#     digits.unshift(remainder)
#     break if number == 0
#   end
#   digits
# end
----------------
# Idiomatic ruby
# def digit_list(number)
#   number.to_s.chars.map(&:to_i)
# end