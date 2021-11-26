# ADJ = %w(quick lazy sleepy ugly)
# NOUNS = %w(fox dog head leg)
# VERBS = %w(jumps lifts bites licks)
# ADV = %w(easily lazily noisily excitedly)

# puts "The #{ADJ.sample} brown #{NOUNS.sample} #{ADV.sample}
#       #{VERBS.sample} the #{ADJ.sample} yellow
#       #{NOUNS.sample}, who #{ADV.sample} #{VERBS.sample} his
#       #{NOUNS.sample} and looks around."

# LS
ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS      = %w(fox dog head leg cat tail).freeze
VERBS      = %w(spins bites licks hurdles).freeze
ADVERBS    = %w(easily lazily noisly excitedly).freeze

# File.open('madlibs.txt') do |file|
#   file.each do |line|
#     puts format(line, noun:      NOUNS.sample,
#                       verb:      VERBS.sample,
#                       adjective: ADJECTIVES.sample,
#                       adverb:    ADVERBS.sample)
#   end
# end

text = "The %{adjective} brown %{noun} %{adverb}
%{verb} the %{adjective} yellow
%{noun}, who %{adverb} %{verb} his
%{noun} and looks around."

puts format(text, noun:      NOUNS.sample,
  verb:      VERBS.sample,
  adjective: ADJECTIVES.sample,
  adverb:    ADVERBS.sample)