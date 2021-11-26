=begin
Problem
  input: n, specifying which fib number
  ouput: nth fib number

Algorithm:
  if n = 1 or if n = 2
    return 1
  else
  set current fib(n) to fib(n-1) + f(n-2)
=end


def fibonacci(n)
  return 1 if n <= 2
  fibonacci(n - 1) + fibonacci(n - 2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765