=begin
Problem
  Anagram class
    match method; called on anagram object
      input: object word, array of words
      output: words from input array that are anagrams of object word

Examples
  anagram: same length; same letters; not the same word; not case sensitive

Data
  input array
  results array

Algorithm
  helper method valid_anagram?
    compares two words
      false if they're already the same
      true if words downcased and sorted are the same
  iterate through input array
    select valid anagrams

=end


class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def match(possible_anagrams)
    possible_anagrams.select { |comparison| valid_anagram?(comparison) }
  end

  private

  def valid_anagram?(comparison)
    word != comparison.downcase && word.chars.sort == comparison.downcase.chars.sort
  end
end
