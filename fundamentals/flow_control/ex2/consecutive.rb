def integer?(number)
  number.to_f % 1 == 0 && number.to_i.to_s == number
end

def valid_number?(number)
  number.to_i > 0 && integer?(number)
end

def valid_operation?(string)
  string == 's' || string == 'p'
end

max = ''
loop do
  puts "Please enter an integer greater than 0: "
  max = gets.chomp
  break if valid_number?(max)
end
max = max.to_i

operation = ''
loop do
  puts "Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp.downcase
  break if valid_operation?(operation)
end

if operation == 's'
  puts "The sum of the integers between 1 and #{max} is #{(1..max).inject(&:+)}"
elsif operation == 'p'
  puts "The product of the integers between 1 and #{max} is #{(1..max).inject(&:*)}"
end
