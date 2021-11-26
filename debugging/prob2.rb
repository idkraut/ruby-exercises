# Given integer array nums, return the third maximum number in this array.
# If the third maximum does not exist, return the maximum number.
# You are not allowed to sort the array

=begin
Problem
  input: array of integers
  output: the third highest value in array;
            maximum if no third maximum
can't sort the array
Algorithm:
  initialize highest, second, and third to 0
  select only unique elements
  iterate through array
  if element is higher than third highest
    if element is higher than second highest
      if element is higher than highest
        third replaced with second
        second replaced with first
        first replaced with element
      else
        third replaced with second
        second replaced with element
      end
    else
      third replaced with element
    end
  return highest if third is nil
  else return third
  end

=end

def third_max(array)
  first = 0
  second = 0
  third = 0

  array.uniq!
  
  array.each do |element|
    if element > third && element != third
      if element > second && element != second
        if element > first && element != first
          third = second
          second = first
          first = element
        else
          third = second
          second = element
        end
      else
        third = element
      end
    end
  end
  return first if third == 0
  third
end

p third_max([3,2,1]) == 1
p third_max([1,2]) == 2
p third_max([2,2,3,1]) == 1
p third_max([1, 3, 4, 2, 2, 5, 6]) == 4