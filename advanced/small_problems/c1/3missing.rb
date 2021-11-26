# def missing(numbers)
#   result = []
#   numbers[0].upto(numbers[-1]) do |num|
#     result << num unless numbers.include?(num)
#   end
#   result
# end

# LS
def missing(array)
  result = []
  array.each_cons(2) do |first, second, third|
    p first
    p second
    p third
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

# def missing(array)
#   result = []
#   array.each_cons(3) do |cons|
#     p cons
#   end
#   result
# end

missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []