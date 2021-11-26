=begin
Problem
  input: a string
            can contain uppercase, lowercase, and non-alphas
  output: a hash, keys represent type of char, value represent percentage of that character in the input string
  no empty strings
Algorithm:
  initialize a hash to count each type
  initialize lowercase array
  initialie uppercase array
  iterate through the string
    if lowercase array includes the char
      add 1 to that keys value
    if upper
      add 1 to upper key
    else
      add 1 to other key
    end
  iterate through the hash
    assign each value to itself divided by strength length
=end

LOWERS = ("a".."z").to_a
UPPERS = ("A".."Z").to_a

def letter_percentages(string)
  counts = {
    lowercase: 0,
    uppercase: 0,
    neither: 0
  }

  string.chars.each do |char|
    if LOWERS.include?(char)
      counts[:lowercase] += 1
    elsif
      UPPERS.include?(char)
      counts[:uppercase] += 1
    else
      counts[:neither] += 1
    end
  end

  counts.each { |key, value| counts[key] = (value / string.length.to_f) * 100}

  counts
end

# LS
def letter_percentages(string)
  counts = {}
  percentages = {}
  characters = string.chars
  length = string.length

  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:neither] = (counts[:neither] / length.to_f) * 100
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
