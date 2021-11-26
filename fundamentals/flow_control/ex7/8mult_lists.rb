# def multiply_list(arr1, arr2)
#   product_array = []
#   arr1.each_with_index do |number, index|
#     product_array << number * arr2[index]
#   end
#   p product_array
# end

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |arr| arr.inject(&:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]