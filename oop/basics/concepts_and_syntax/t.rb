def format_yes_or_no(answer)
  answer = answer.downcase
  # binding.pry
  case answer
  when 'y' || 'yes'
     "worked"
  when 'n' || 'no'
    answer
  else
    answer
  end
end

puts format_yes_or_no("YES")