puts "Enter the first number: "
first = gets.chomp.to_i

puts "Enter the second number: "
second = gets.chomp.to_i

sum = first + second
difference = first - second
product = first * second
quotient = first / second
remainder = first % second
power = first ** second

puts "#{first} + #{second} = #{sum}"
puts "#{first} - #{second} = #{difference}"
puts "#{first} * #{second} = #{product}"
puts "#{first} / #{second} = #{quotient}"
puts "#{first} % #{second} = #{remainder}"
puts "#{first} ** #{second} = #{power}"

