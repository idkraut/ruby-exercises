loop do
    reply = nil
    number_of_lines = nil
    loop do
      puts '>> How many output lines do you want? Enter a number >= 3 (Q to quit):'
      reply = gets.chomp.downcase
      break if reply == 'q'

      number_of_lines = reply.to_i
      break if number_of_lines >= 3 
      puts ">> That's not enough lines."
    end
    
    break if reply == 'q'

    while number_of_lines > 0
      puts 'Launch School is the best!'
      number_of_lines -= 1
    end  
end
