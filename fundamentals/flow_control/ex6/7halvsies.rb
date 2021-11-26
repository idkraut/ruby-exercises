# def halvsies(array)
#   # return [[],[]] if array.empty?
#   return_array = []
#   # if array.length.even?
#   #   middle_index = (array.length / 2) - 1
#   # else
#   #   middle_index = array.length / 2
#   # end
#   middle_index = ((array.length / 2.0).round) - 1
#   return_array << array[0..middle_index]
#   return_array << array[(middle_index + 1)..-1]
#   p return_array
# end

def halvsies(array)
  middle  = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end

halvsies((0..12).to_a)
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]