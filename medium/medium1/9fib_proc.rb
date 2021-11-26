=begin
Problem
  input: n, specifying which fib number
  ouput: nth fib number

Algorithm:
  initialize array with [1, 1]
  n - 2 times
    add last and second-to-last elements
    append result
  return last element
=end

def fibonacci(n)
  return 1 if n <= 2

  fib_array = [1, 1]
  (n - 2).times do
    fib_array << fib_array[-2] + fib_array[-1]
  end
  return fib_array[-1]
end

# LS
def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end

p fibonacci(1)
p fibonacci(2)
p fibonacci(3)
p fibonacci(20)
p fibonacci(100_001)