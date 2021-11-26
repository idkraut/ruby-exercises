# a = Proc.new { puts 'x' }
# a.call
# p a
# puts a


# a = 5
# proccy = Proc.new { puts a }

# def testing(num, proc)
#   num += 7
#   proc.call
# end

# testing(a, proccy)

# def yo(proc)
#   proc.call
#   "here"
# end

# a = 5
# proc_1 = Proc.new { |b| puts a, b }


# p yo(proc_1)

def batman_ironman_proc
  victor = Proc.new { return "Batman will win!" }
  victor.call
  "Iron Man will win!"
end

# a = 5

# def addition
#   a = 4
#   yield(a)
# end

# p addition { |num| num + a }

# def thrice
#   yield
#   yield
#   yield
# end

# def six_times(&thing) # block to proc
#   # thing #local variable that points to a proc object
#   thrice(&thing) # proc to block
#   thrice(&thing) # proc to block
# end

# x = 4
# six_times { x += 10 }
# puts "value of x after: #{x}" # => 64

# def bigger
#   yield
# end

# x = 4
# bigger do
#   x += 2
#   x - 1
# end

# p x
# p bigger { x }