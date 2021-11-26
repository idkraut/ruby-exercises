def compute(arg)
  block_given? ? yield(arg) : 'Does not compute.'
end

p compute(2) { 5 + 3 } == 8
p compute(2) { 'a' + 'b' } == 'ab'
p compute(8) == 'Does not compute.'
p compute(6) { |x| x * 5}