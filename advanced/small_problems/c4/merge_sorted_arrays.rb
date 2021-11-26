=begin
Problem
  input: two sorted arrays
  output: a single sorted array containing all elements from both inputs

Rules
  can't use any sort methods
  must build the result one element at a time


Algorithm
  init results array
  loop
    if arr1 is empty
      append arr2 to results
      break
    elsif arr2 is empty
      append arr2 to results
      break
    end
    if arr1[0] <= arr2[0]
      append arr1 element to the results
      delete arr1[0]
    else
      append arr2 element
      delete arr2[0]
    end
  result
=end

def merge(arr1, arr2)
  arr1_clone = arr1.clone
  arr2_clone = arr2.clone
  result = []

  loop do
    if arr1_clone.empty?
      result.concat(arr2_clone)
      break
    elsif arr2_clone.empty?
      result.concat(arr1_clone)
      break
    end

    if arr1_clone[0] <= arr2_clone[0]
      result << arr1_clone.shift
    else
      result << arr2_clone.shift
    end
  end

  result
end


# LS
# def merge(array1, array2)
#   index2 = 0
#   result = []

#   array1.each do |value|
#     while index2 < array2.size && array2[index2] <= value
#       result << array2[index2]
#       index2 += 1
#     end
#     result << value
#   end

#   result.concat(array2[index2..-1])
# end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# p merge([], [1, 4, 5]) == [1, 4, 5]
# p merge([1, 4, 5], []) == [1, 4, 5]