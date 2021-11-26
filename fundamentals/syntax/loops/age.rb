# puts "What is your age in years?"
# # age = gets.to_i
# # puts (age * 12)
# puts gets.to_i * 12


loop do 
    puts "Want to print?"
    choice = gets.chomp.downcase
    if choice == "y"
        puts "OK" 
        break
    elsif choice == "n"
        puts "Why?"
        break
    else 
        puts "Invalid input!"
    end
end