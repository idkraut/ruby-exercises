# def running_total(array)
#   sum = 0
#   array.each_with_object([]) do |value, array|
#     sum += value
#     array << sum
#   end
# end

# def running_total(array)
#   sum = 0
#   array.map { |element| sum += element}
# end

# def running_total(array)
#   running_total = 0
#   running_array = []
#   array.each do |element|
#     running_total += element
#     running_array << running_total
#   end
#   running_array
# end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []