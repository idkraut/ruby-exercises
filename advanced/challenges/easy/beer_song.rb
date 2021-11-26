=begin
Problem
  ::verse
    input: number representing the verse
    output: that verse of the beer song
  ::verses
    input: numbers representing verses
    output: those verses of the beer song
  ::lyrics
    entire lyrics

class BeerSong
no instantiations

Examples
  99-3
    num beers, num beers
    num - 1 beers
  2
    2 beers, 2 beers
    1 beer
  1
    1 beer, 1 beer
    no more beers
  0
    no more beers, no more beers
    99 beers

Data
  array to store input verses

Algorithm
  verse
    conditionals based on verse number, following above rules
  verses
    store nums in array
    call verse on each num
  lyrics
    call verses with 99-0
=end

class BeerSong
  def self.verse(num)
    if (3..99).cover?(num)
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
    elsif num == 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    elsif num == 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    elsif num == 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  def self.verses(first, last)
    lyrics = []
    (last..first).each { |num| lyrics << verse(num) }
    lyrics.reverse.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end
end


