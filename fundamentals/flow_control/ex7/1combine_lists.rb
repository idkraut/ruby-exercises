# def interleave(array1, array2)
#   arr_length = array1.size
#   interleaved_array = []
#   arr_length.times do |idx|
#     interleaved_array << array1[idx]
#     interleaved_array << array2[idx]
#   end
#   interleaved_array
# end

# def interleave(array1, array2)
#   result = []
#   array1.each_with_index do |element, index|
#     result << element << array2[index]
#   end
#   result
# end

def interleave(array1, array2)
  array1.zip(array2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']