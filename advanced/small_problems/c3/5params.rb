items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*first_three, last|
  puts first_three.join(', ')
  puts last
end

gather(items) do |first, *middle_two, last|
  puts first
  puts middle_two.join(', ')
  puts last
end

gather(items) do |first, *last_three|
  puts first
  puts last_three.join(', ')
end

gather(items) do |first, second, third, last|
  puts "#{first}, #{second}, #{third}, and #{last}"
end