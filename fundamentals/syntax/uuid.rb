# input: nothing
# output: UUID
  # a string
    # 32 hexadecimal characters
    # broken into sections
      # 8-4-4-4-12

# example: f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91
# data_structures:
  # array to create the string
  # hash to store hexadecimal letters?

# algorithm:
  # create hex hash constant
  # initialize array
  # randomly generate a value for each character
  # if the value is greater than 9, translate to hex letter
  # replace certain indexes with dashes?
  # convert to string





def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end

p generate_UUID


# HEX_LETTERS = {
#   10 => 'a',
#   11 => 'b',
#   12 => 'c',
#   13 => 'd',
#   14 => 'e',
#   15 => 'f'
# }

# def uuid_generator
#   uuid = []
#   36.times do |idx|
#     hex_char = rand(0..15)
#     dash_indexes = [8, 13, 18, 23]
#     hex_char = HEX_LETTERS[hex_char] if hex_char > 9
#     hex_char = '-' if dash_indexes.include?(idx)
#     uuid << hex_char.to_s
#   end
#   uuid.join
# end

# p uuid_generator