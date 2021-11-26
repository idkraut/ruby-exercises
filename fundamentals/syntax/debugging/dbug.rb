# def find_first_nonzero_among(numbers)
#   numbers.each do |n|
#     return n if n.nonzero?
#   end
# end

# Examples

# find_first_nonzero_among(0, 0, 1, 0, 2, 0)
# find_first_nonzero_among(1)

# def predict_weather
#     sunshine = ['true', 'false'].sample
  
#     if sunshine
#       puts "Today's weather will be sunny!"
#     else
#       puts "Today's weather will be cloudy!"
#     end
#   end

#   puts predict_weather

def multiply_by_five(n)
    n * 5
  end
  
  puts "Hello! Which number would you like to multiply by 5?"
  number = gets.chomp
  
  puts "The result is #{multiply_by_five(number)}!"
