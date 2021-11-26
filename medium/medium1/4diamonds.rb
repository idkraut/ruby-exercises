=begin
Problem:
  input: n, an odd integer
          represents dimension of grid
          length of each row
          number of lines
  output:
        a diamond
          middle row of n stars
          n lines
          vertical and horizontal symmetry
        we start with n / 2 spaces and 1 star
          next, n / 2 - 1 spaces, 3 stars
                n / 2 - 2 , 5 stars
                up to 0 spaces, 9 stars,
                then back down
Data

Algorithm
  initialize spaces to n/2
  initialize stars to 1
  initialize a lines array
  start a loop
      initialize current line to spaces + stars
      add line to lines array
      print line
      spaces -= 1
      stars += 2
  break after n / 2 + 1 iterations

=end


# def diamond(n)
#   spaces = n / 2
#   stars = 1
#   lines = [] # to store top half

#   loop do # print top half
#     current_line = " " * spaces + "*" * stars
#     puts current_line
#     break if stars >= n

#     lines << current_line

#     spaces -= 1
#     stars += 2
#   end

#   # print bottom half
#   lines.reverse.each { |line| puts line}
# end

# LS
def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

diamond(21)