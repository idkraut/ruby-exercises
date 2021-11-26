def is_odd?(int)
  int % 2 != 0
end

number = gets.chomp.to_i
puts is_odd?(number)