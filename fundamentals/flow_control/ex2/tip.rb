puts "What's the bill?"
bill_amount = gets.chomp.to_f

puts "What's the tip percentage?"
tip_rate = gets.chomp.to_f / 100

tip = (tip_rate * bill_amount).round(2)
total = bill_amount + tip

puts "The tip is $%.2f" %tip
puts "The total is $%.2f" %total
