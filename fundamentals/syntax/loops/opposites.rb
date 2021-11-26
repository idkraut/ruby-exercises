def valid_number?(number_string)
    number_string.to_i.to_s == number_string && number_string.to_i != 0
end

first = nil
second = nil

def get_number
    loop do
        puts "Please enter a positive or negative integer"
        number = gets.chomp
        return number.to_i if valid_number?(number)
        puts "Invalid. Only non-zero integers allowed."
    end
end

loop do
    first = get_number
    second = get_number
    break if first * second < 0
    puts "Sorry. One integer must be positive and one must be negative."
    puts "Please start over."
end

sum = first + second
puts "#{first} + #{second} = #{sum}"

sum = first + second
puts "#{first} + #{second} = #{sum}"


# first attempt; not DRY
# loop do
#     loop do
#         puts "Please enter a positive or negative integer"
#         first = gets.chomp
#         break if valid_number?(first)
#         puts "Invalid. Only non-zero integers allowed."
#     end
    
#     loop do
#         puts "Please enter a positive or negative integer"
#         second = gets.chomp
#         break if valid_number?(second)
#         puts "Invalid. Only non-zero integers allowed."
#     end 

#     first = first.to_i
#     second = second.to_i

#     break if first * second < 0
#     puts "Sorry. One integer must be positive and one must be negative."
#     puts "Please start over."
# end