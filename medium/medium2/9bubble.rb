=begin
Problem:
  input: array, can contain integers or strings
  output: sorted array, using bubble sort

Algorithm:
  loop until sorted
    swap_flag to false
    initialize index1 to 0
    initialize index2 to 1
    loop through indices
      *compare index1 elem to index2 elem
      *swap if index1 elem > index2 elem
        swap flag to true
      break if index2 is array.size - 1
      increment index1 and index2
    break if swap_flag is false
=end

def bubble_sort!(array)
  loop do
    swapped = false
    index1 = 0
    index2 = 1
    loop do
      if array[index1] > array[index2]
        array[index1], array[index2] = array[index2], array[index1]
        swapped = true
      end
      break if index2 == array.length - 1
      index1 += 1
      index2 += 1
    end
    break if !swapped
  end
  array
end

# LS
def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end

# array = [5, 3]
# p bubble_sort!(array)

array = [6, 2, 7, 1, 4]
p bubble_sort!(array)

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)