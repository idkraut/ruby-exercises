def multiply_all_pairs(arr1, arr2)
  products = []
  arr1.each do |number1|
    arr2.each do |number2|
      products << number1 * number2
    end
  end
  products.sort
end

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |array| array.inject(&:*) }.sort
end

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |num1, num2| num1 * num2 }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]