=begin
Problem
  input: number of digits in a fibonacci number
  output: first number in Fib sequence with the input number of digits
Data
  integers
  array
Algo:
  initialize fib sequence array with 1,1
  << into array sum of last two elements
  stop when shoveled element is length of input
=end

# def find_fibonacci_index_by_length(number_of_digits)
#   fib_nums = [1, 1]
#   first_found_fib = nil
#   loop do
#     fib_nums << fib_nums[-2] + fib_nums[-1]
#     if fib_nums[-1].digits.size == number_of_digits
#       first_found_fib = fib_nums[-1]
#       break
#     end
#   end
#   fib_nums.index(first_found_fib) + 1
# end

def find_fibonacci_index_by_length(number_digits)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.digits.size == number_digits

    first = second
    second = fibonacci
  end
  index
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847