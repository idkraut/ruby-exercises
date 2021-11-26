def valid_number?(number_string)
    number_string.to_i.to_s == number_string
  end
numer = nil
denom = nil
loop do
    puts "Numerator?"
    numer = gets.chomp
    break if valid_number?(numer)
    puts "Invalid numerator"
end
loop do
    puts "Denominator?"
    denom = gets.chomp
    if denom.to_i == 0 
        puts "Denominator cannot be 0"

    else
        break if valid_number?(denom)
        puts "Denominator must be an integer"
    end
end

quotient = numer.to_i / denom.to_i
puts "#{numer} / #{denom} is #{quotient}"


