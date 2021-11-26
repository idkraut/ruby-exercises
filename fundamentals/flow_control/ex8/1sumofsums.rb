=begin
Problem
  input: array of integers
  output: an integer representing a sum of sums
            each component sum is built by adding first element to successively longer runs of elements
Data
Algo
  sum starts at 0
  then sum is sum + sum + next value
  iterate through each element, add sum to sum  + (sum + value)
=end


# def sum_of_sums(array)
#   total_sum = 0
#   current_sum = 0

#   array.each do |number|
#     current_sum += number
#     total_sum += current_sum
#   end

#   total_sum
# end

def sum_of_sums(numbers)
  sum_total = 0
  1.upto(numbers.size) do |count|
    sum_total += numbers[0, count].reduce(:+)
  end
  sum_total
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35