# colors = ['red', 'yellow', 'purple', 'green']

# colors.each { |color| puts color}

#----------------------------
# numbers = [1, 2, 3, 4, 5]
# doubled_numbers = numbers.map { |number| number * 2 }
# p doubled_numbers

#----------------------------
numbers = [5, 9, 21, 26, 39]
divisible_by_three = numbers.select { |number| number % 3 == 0}
p divisible_by_three