# determine the century of argument
  # floor divide 
    # if century % 100 is 0, century is n
    # else century is n + 1
# add to string
# determine appropriate suffix

# add to string



def century_number(year)
  century = year.to_i / 100
  if year % 100 != 0
    century += 1
  end
  century
end

def century_suffix(year)
  return 'th' if [11, 12, 13].include?(year.to_i % 100)

  last_digit = year.to_i % 10
  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

def century(year)
  number = century_number(year)
  suffix = century_suffix(number)
  result = number.to_s + suffix
end


puts century(2000) #== '20th'
puts century(2001) #== '21st'
puts century(1965) #== '20th'
puts century(256) #== '3rd'
puts century(5) #== '1st'
puts century(10103) #== '102nd'
puts century(1052) #== '11th'
puts century(1127) #== '12th'
puts century(11201) #== '113th'