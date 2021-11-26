def zip(arr1, arr2)
  result = []

  arr1.each_with_index do |e1, index|
      result << [e1, arr2[index]]
  end

  result
end

# LS
def zipper(array1, array2)
  array1.each_with_index.with_object([]) do |(element, index), result|
    result << [element, array2[index]]
  end
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]