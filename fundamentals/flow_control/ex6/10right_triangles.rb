=begin
Problem
  input: integer n
            represents number of stars per side of right triangle
  output: n lines
            first line has one star
            each line increments number of stars
            last line has n stars
Data

Algo:
  iterate with index n times
  spaces variable?
  stars variable?
  first iteration outputs n -1 spaces followed by 1 star
  each iteration
    spaces decreases by 1
    stars increases by 1
  last iteration
    n-n spaces and n stars
=end

def triangle(number_stars)
  spaces = number_stars - 1
  stars = 1
  counter = 0
  loop do
    spaces.times { print ' '}
    stars.times { print '*' }
    puts ''
    spaces -= 1
    stars += 1
    counter += 1
    break if counter == number_stars
  end
end

def triangle(num)
  spaces = num - 1
  stars = 1

  num.times do |n|
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end

triangle(3)
triangle(9)