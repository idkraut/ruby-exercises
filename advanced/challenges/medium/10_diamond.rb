=begin
Problem
  input: a letter of the alphabet
        represents highest letter of star
        seen in the middle row
  output: a diamond printed to screen
          composed of letter from A to input
          first and last rows have one A
dimensions
  letter of alphabet * 2 - 1
first row
  left spaces: dim / 2
  mid space: 0
  right space: dim /2
diamond is symmetrical

::method make_diamond
Diamond class

Data
  strings
  array to store first half

Algorithm
  nxn dimension
  rows array
  n equals the alpha position * 2 - 1

  index1 is n / 2
  index2 is n / 2
  use range to iterate through letters A to input
    build row
      row starts as n spaces
      idx1  replace with letter
      idx2 replaced with letter
    add row to results

  print first half
  delete last, reverse array, print second half
=end

class Diamond
  def self.make_diamond(last_letter)
    width = alpha_position(last_letter) * 2 - 1
    first_half = build_first_half(last_letter, width)
    complete_diamond(first_half)
  end

  def self.build_first_half(last_letter, width)
    first_half = []
    pos1 = width / 2
    pos2 = pos1

    ("A"..last_letter).each do |letter|
      row = ' ' * width
      row[pos1] = letter
      row[pos2] = letter
      pos1 -= 1
      pos2 += 1
      first_half << row
    end

    first_half
  end

  def self.complete_diamond(first_half)
    result = ''
    first_half.each { |row| result += row + "\n" }
    first_half.pop # remove middle row
    first_half.reverse.each { |row| result += row + "\n" }
    result
  end

  def self.alpha_position(letter)
    letter.ord - 64
  end
end

# LS
# class Diamond
#   def self.make_diamond(letter)
#     range = ('A'..letter).to_a + ('A'...letter).to_a.reverse
#     diamond_width = max_width(letter)

#     range.each_with_object([]) do |let, arr|
#       arr << make_row(let).center(diamond_width)
#     end.join("\n") + "\n"
#   end

#   private

#   def self.make_row(letter)
#     return "A" if letter == 'A'
#     return "B B" if letter == 'B'

#     letter + determine_spaces(letter) + letter
#   end

#   def self.determine_spaces(letter)
#     all_letters = ['B']
#     spaces = 1

#     until all_letters.include?(letter)
#       current_letter = all_letters.last
#       all_letters << current_letter.next
#       spaces += 2
#     end

#     ' ' * spaces
#   end

#   def self.max_width(letter)
#     return 1 if letter == 'A'

#     determine_spaces(letter).count(' ') + 2
#   end
# end

puts Diamond.make_diamond('H')
