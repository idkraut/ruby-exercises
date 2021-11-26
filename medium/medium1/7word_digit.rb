=begin
Problem
  input: a string, may contain words representing numbers 0-9
  output: same string, but words representing numbers are now digits
Algorithm:
  initialize hash with english to digit mapping
  split string into words array
  map word to digit if word is a hash key
  join words on spaces
  return string
=end

NUMBERS = {
  'zero' => 0,
  'one' => 1,
  'two' => 2,
  'three' => 3,
  'four' => 4,
  'five' => 5,
  'six' => 6,
  'seven' => 7,
  'eight' => 8,
  'nine' => 9,
}

def word_to_digit(string)
  words = string.split
  p words

  punctuation = ''
  add_punct = false

  words.map! do |word|
    if !("a".."z").include?(word.downcase[-1])
      punctuation = word[-1]
      word = word[0...-1]
      add_punct = true
      p word
      p punctuation
    end

    if NUMBERS.has_key?(word.downcase)
      if add_punct
        NUMBERS[word.downcase].to_s + punctuation
      else
        NUMBERS[word.downcase]
      end
    else
      if add_punct
        word + punctuation
      else
        word
      end
    end
  end

  p words.join(' ')
end

# LS
DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}.freeze

def word_to_digit(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
  end
  words
end

word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'