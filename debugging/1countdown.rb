# def decrease(counter)
#   counter -= 1
# end

# counter = 10

# 10.times do
#   puts counter
#   decrease(counter)
# end

# puts 'LAUNCH!'


# fix
# def decrease(counter)
#   counter - 1
# end

# counter = 10

# 10.times do
#   puts counter
#   counter = decrease(counter)
# end

# puts 'LAUNCH!'


# or
10.downto(1) { |count| puts count}
puts 'LAUNCH!'