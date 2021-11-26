def count_occurrences(array)
  occurrences = {}

  array.each do |element|
    occurrences[element] ? occurrences[element] += 1: occurrences[element] = 1
  end

  occurrences.each { |element, count| puts "#{element}: #{count}"}
end


# def count_occurrences(arr)
#   count = Hash.new(0)
#   arr.each do |word|
#     count[word.downcase] += 1
#   end
#   p count
# end


vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

