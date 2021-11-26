PUNCTUATION = ['.', '!', '?']

text = File.read('frankenstein.txt')

sentences = text.split('.')

sentences = sentences.map! do |sentence|
  sentence.split('!')
end.flatten.map! do |sentence|
  sentence.split('?')
end.flatten

longest_sentence = ''
most_words = 0

sentences.each do |sentence|
  if sentence.split.length > most_words
    longest_sentence = sentence
    most_words = sentence.split.length
  end
end

p longest_sentence
p most_words


# LS
text = File.read('sample_text.txt')
sentences = text.split(/\.|\?|!/)
largest_sentence = sentences.max_by { |sentence| sentence.split.size }
largest_sentence = largest_sentence.strip
number_of_words = largest_sentence.split.size

puts "#{largest_sentence}"
puts "Containing #{number_of_words} words"