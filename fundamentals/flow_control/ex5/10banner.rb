=begin
Problem
  input: a string, will always fit in terminal window
  output: a box around the string
            adjust to size of input

Algo
  initialize var to length of streng
  first line
    print +
    print length + 2 -
    print +
  second line
    print |
    print length + 2 spaces
    print |
  third line
    print |
    print space
    print string
    print space
    print |
  fourth line
    second line
  fifth line
    first line
=end

# def print_in_box(string)
#   str_len = string.size
#   first_line = '+'
#   (str_len + 2).times { |_| first_line << '-' }
#   first_line << '+'
#   puts first_line

#   second_line = '|'
#   (str_len + 2).times { |_| second_line << ' ' }
#   second_line << '|'
#   puts second_line

#   third_line = '| '
#   third_line << string
#   third_line << ' |'
#   puts third_line

#   puts second_line
#   puts first_line

# end

def print_in_box(string)
  str_len = string.size
  first_line = "+#{'-' * (str_len + 2)}+"
  second_line = "|#{' ' * (str_len + 2)}|"

  puts first_line
  puts second_line
  puts "| #{string} |"
  puts second_line
  puts first_line
end

print_in_box('yes please!')