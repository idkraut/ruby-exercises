=begin
Problem
  input: odd num reprenting dimension of num x num grid
  output: 8 pointed star within grid

middle star and middle row always at num / 2 + 1
each row contains 3 stars except middle row which contains num stars

1st row
  star at 0
  star at mid
  star at num
2nd row
  star at 1
  star at mid
  star at num - 1
repeat until star 1 at mid - 1 and star3 at mid + 1
then mid row with stars 0 to num -1

Data
init mid to num / 2 -1
array to store first half of star
loop until mid - 1
  array for star indexes
    star1 starts at 0
    star2 is always mid
    star3 starts at num - 1
  build each row
    star if index is in star index array
    space otherwise
    add to rows array

build mid row with all stars
reverse rows array and build second half of star from stored rows
=end

def star(num)
  mid = num / 2
  first_half = []

  st1 = 0
  st2 = mid
  st3 = num - 1

  mid.times do |row_num|
    first_half << build_row(num, st1, st2, st3)
    st1 += 1
    st3 -= 1
  end

  first_half.each { |row| puts row}
  puts "*" * num
  first_half.reverse_each { |row| puts row }
end

def build_row(num, *stars)
  result = ''
  num.times do |idx|
    if stars.include?(idx)
      result += '*'
    else
      result += ' '
    end
  end
  result
end

# LS
def print_row(grid_size, distance_from_center)
  number_of_spaces = distance_from_center - 1
  spaces = ' ' * number_of_spaces
  output = Array.new(3, '*').join(spaces)
  puts output.center(grid_size)
end

def star(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(1) { |distance| print_row(grid_size, distance) }
  puts '*' * grid_size
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

star(15)
