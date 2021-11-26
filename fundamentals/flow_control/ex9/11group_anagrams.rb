=begin
Problem
  input: array containing words
  output: arrays which contain grouped anagrams
Examples
  each array printed separately
  words aren't repeated
Data
  input words array
  anagrams hash
    keys are sorted words
Algo
  iterate through input array
    for each word
      if anagram hash has sorted word as key
        add word to that key's value, an array
      else
        create new hash with key that is the sorted word
        add word to that hash in a new array
  iterate through anagram hash
    for each key
      print value array
    end
=end

def anagrams(words)
  anagrams_hash = Hash.new([])
  words.each do |word|
    sorted = word.chars.sort.join
    anagrams_hash[sorted] += [word]
  end
  anagrams_hash.each { |key, value| p value}
end

# LS
def anagrams(words)
  words.each do |word|
    key = word.split('').sort.join
    if result.has_key?(key)
      result[key].push(word)
    else
      result[key] = [word]
    end
  end

  result.each_value do |v|
    puts "------"
    p v
  end
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

anagrams(words)