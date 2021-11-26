def sequence(count, first)
  counter = 0
  multiplier = 1
  result = []
  loop do
    break if counter == count
    result << first * multiplier
    counter += 1
    multiplier += 1
  end
  result
end

def sequence(count, first)
  result = []
  1.upto(count) { |multiplier| result << first * multiplier}
  result
end

# LS 1
def sequence(count, first)
  sequence = []
  number = first

  count.times do
    sequence << number
    number += first
  end

  sequence
end

# LS 2
def sequence(count, first)
  (1..count).map { |value| value * first }
end


p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []