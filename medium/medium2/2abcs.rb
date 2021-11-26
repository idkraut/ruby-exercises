=begin
Problem
  input: a string, a word to be spelled from blocks
  output: true or false
            true if string can be spelled with blocks
            false otherwise

  13 blocks, all letters are represented
      but each block can only be used once
      and only one side of each block can be used
  case-insensitive

  if the next letter is on a block that has been used, we can't form the word

Algorithm:

    iterate through each char in the string
        iterate through blocks array
        if block contains the character
          if block has been used
            next block
          else
            put current block in used blocks
        end

LS Algorithm
    initialize blocks array
        elements are two character strings representing each block

    convert input string to uppercase
    count how many times each block element occurs in the string
        if it's greater than two, then either a letter is repeated or both letters in a block are needed
          so we return false
        end
        return true if no blocks occur more than once
=end


def block_word?(string)
  used_blocks = []
  blocks = [["B","O"], ["X", "K"], ["D", "Q"], ["C", "P"], ["N", "A"],
            ["G", "T"], ["R", "E"], ["F", "S"], ["J", "W"], ["H", "U"],
            ["V", "I"], ["L", "Y"], ["Z", "M"]]
  string.upcase.chars.each do |char|
    blocks.each do |block|
      if block.include?(char)
        if used_blocks.include?(block)
          return false
        else
          used_blocks << block
        end
      end
    end
  end
  p used_blocks
  return true
end

# LS
BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end

# p block_word?('bm')
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true