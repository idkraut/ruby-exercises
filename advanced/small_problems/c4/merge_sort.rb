=begin
Problem
  input: an array; all ints or all strings
  output: an array containing same elements, sorted

Examples
  recursive division in half until all single elements
  element divisions are sorted, then sorted divisions are sorted

Data
  result array?

Algorithm
  return arr if size is 1

  divide array in half
    arr1 is first half
    arr2 is second half
  if both have size 1
    use merge helper method
    return merged array
  else
    call merge_sort on each
=end

# def merge_sort(array)
#   return array if array.size == 1

#   arr1, arr2 = divide_array(array)
#   arr1 = merge_sort(arr1)
#   arr2 = merge_sort(arr2)

#   merge(arr1, arr2)
# end

# def divide_array(arr1)
#   mid_idx = arr1.size / 2 - 1
#   [arr1[0..mid_idx], arr1[mid_idx + 1..-1]]
# end

# def merge(arr1, arr2)
#   arr1_clone = arr1.clone
#   arr2_clone = arr2.clone
#   result = []

#   loop do
#     if arr1_clone.empty?
#       result.concat(arr2_clone)
#       break
#     elsif arr2_clone.empty?
#       result.concat(arr1_clone)
#       break
#     end

#     if arr1_clone[0] <= arr2_clone[0]
#       result << arr1_clone.shift
#     else
#       result << arr2_clone.shift
#     end
#   end

#   result
# end

# LS
def merge_sort(array)
  return array if array.size == 1

  sub_array_1 = array[0...array.size / 2]
  sub_array_2 = array[array.size / 2...array.size]

  sub_array_1 = merge_sort(sub_array_1)
  sub_array_2 = merge_sort(sub_array_2)

  merge(sub_array_1, sub_array_2)
end

# Ricky Viejo
def merge_sort(ary)
  if ary.size > 1
    mid = ary.size / 2
    left, right = ary[0...mid], ary[mid..-1]
    left, right = merge_sort(left), merge_sort(right)
    merge(left, right)
  else
    ary
  end
end

def merge_sort(ary)
  result = []
  ary.each do |elt|
    result = merge(result, [elt])
  end
  result
end



p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
