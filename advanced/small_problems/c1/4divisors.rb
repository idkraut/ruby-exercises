def divisors(integer)
  result = [1, integer]
  2.upto(Math.sqrt(integer)) do |div|
    quot = integer / div.to_f
    result << quot.to_i << div if quot % 1 == 0
  end
  p result.sort.uniq
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
divisors(999962000357)