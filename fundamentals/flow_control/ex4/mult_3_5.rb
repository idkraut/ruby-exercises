# initialize empty array
# iterate through range
# add to array if evenly divisible by 3 or 5
# sum array

def multisum(max)
  multiples = []
  (1..max).each { |num| multiples << num if num % 3 == 0 || num % 5 == 0}
  multiples.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168