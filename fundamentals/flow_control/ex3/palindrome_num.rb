def palindromic_number?(number)
  number.digits == number.digits.reverse
end

# def palindromic_number?(number)
#   palindrome?(number.to_s)
# end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true