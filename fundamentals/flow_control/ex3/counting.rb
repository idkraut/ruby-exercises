print "Please write word or multiple words: "
reply = gets.chomp
count = reply.delete(' ').length


puts "There are #{count} characters in \"#{reply}\"."