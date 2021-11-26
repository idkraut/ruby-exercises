# def fibonacci(n)
#   return 1 if n <= 2

#   fib_array = [1, 1]
#   (n - 2).times do
#     fib_array << fib_array[-2] + fib_array[-1]
#   end
#   return fib_array[-1]
# end

# def fibonacci_last(n)
#   p last_digit = fibonacci(n).digits[0]
# end


# LS
def fibonacci_last(nth)
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  p last_2.last
end

fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4