=begin
Problem
  input: a string, represents a scrabble word
  output: score for word, integer

Examples
  must be alphabetical
  case insensitive

Data
  hash for converting chars to ints
  int score that accumulates

Algorithm
  initialize score to 0
  initialize conversion hash
  have helper method to convert char to int
    set result to 0
    iterate through the hash
      if key contains char, add value to result
      return result
  iterate through chars, convert and add conversion to score
  return score

=end

class Scrabble
  SCORES = {
    %w[A E I O U L N R S T] => 1,
                    %w[D G] => 2,
                %w[B C M P] => 3,
              %w[F H V W Y] => 4,
                      %w[K] => 5,
                    %w[J X] => 8,
                    %w[Q Z] => 10
  }

  attr_reader :word

  def initialize(word)
    @word = word
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    return 0 if word == nil
    result = 0
    word.upcase.each_char { |char| result += letter_to_val(char) }
    result
  end

  def letter_to_val(char)
    result = 0
    SCORES.each do |letters, value|
      result += value if letters.include?(char)
    end
    result
  end

end
