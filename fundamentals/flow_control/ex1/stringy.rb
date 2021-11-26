# LS solution
def stringy(size)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end
# --------------------
# Lewis's solution

# def string(int)
#   '10' * (int/2) + '1' * (int%2)
# end
# --------------------
# First Attempt

# def stringy(integer)
#   string = ''
#   i = 0
#   while i < integer
#     string << '1'
#     i += 1
#     if i < integer
#       string << '0'
#       i += 1
#     end
#   end
#   string
# end
# --------------------
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'