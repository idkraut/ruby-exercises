=begin
Problem
  input: n, an integer representing first n positive integers
  output:
        an integer, representing the difference between two sums
        first sum is the square of the sum of the first n integers
        second sum is the sum of the squares of the first n integers
Algorithm:
  squares_sum to 0
  int_sum to 0
  1 until n
    int_sum += n
    squares_sum += n**2
    n += 1
=end


def sum_square_difference(n)
  squares_sum = 0
  int_sum = 0
  (1..n).each do |current_num|
    int_sum += current_num
    squares_sum += current_num ** 2
  end
  int_sum**2 - squares_sum
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150


