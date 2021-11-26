def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end 
  factors
end

puts factors(0)



# def factors(number)
#   divisor = number
#   factors = []
#   begin
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
#   end until divisor == 0
#   factors
# end

# number = 0
# loop do
#   puts "Please enter a number greater than 0"
#   number = gets.chomp.to_i
#   if number < 0 || number == 0
#     next
#   else
#     break
#   end
# end
# puts factors(number)