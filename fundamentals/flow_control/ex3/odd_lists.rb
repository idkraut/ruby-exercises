# def oddities(array)
#   odds = []
#   array.each_index { |idx| odds << array[idx] if idx.even? }
#   odds
# end

def oddities(array)
  odds = []
  array.select { |e| odds << e if array.index(e).even? }
  odds
end

a = [1,2,3,4,5,6,7,8]
p oddities(a)