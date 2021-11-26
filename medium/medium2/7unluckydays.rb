=begin
Problem:
  input: a year, after 1752
  output: number of Friday 13ths in that year

  Friday is the 6th day of the week
  There will be 12 possible 13ths

  without leap years

Algorithm
  initialize fri 13 count to 0
  initialize date to first 13th of the year
  iterate through 13s of the months
    fri 13 count += 1 if 13 == friday
  return fri 13 count
=end

# LS
require 'date'

def friday_13th(year)
  unlucky_count = 0
  thirteenth = Date.civil(year, 1, 13)
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2