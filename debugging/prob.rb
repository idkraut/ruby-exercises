# Given an array of n positive integers and a positive integer s,
# find the minimal length of a contiguous subarray of which the sum ≥ s.
# If there isn't one, return 0 instead.



=begin
Problem
  input: array of n positive integers, a positive integer s
  output: in integer, representing the length of the smallest contiguous subarray whose sum is >= s
          0 if no such subarray
          can be one element

Algorithm:
  find all subarrays
    initialize empty array
    iterate through each element, index1 will be index 0 to length - 1
      from index1, iterate and build subs; index2 will be index1 - length - 1
      add index1..index2 to subarrays array
  select subarrays whose sum is >= s
  select subarray with the smallest length
=end

def subarrays(array)
  subarrays = []
  (0...array.length).each do |index1|
    (index1...array.length).each do |index2|
      subarrays << array[index1..index2]
    end
  end
  subarrays
end

def minSubLength(array, target_sum)
  subs = subarrays(array)

  subs = subs.select { |subarray| subarray.sum >= target_sum }
  return 0 if subs == []

  subs = subs.min_by { |sub| sub.length }
  subs.length
end

p minSubLength([2,3,1,2,4,3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0