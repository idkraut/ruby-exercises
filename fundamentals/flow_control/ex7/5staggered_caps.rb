=begin
Problem
  input: string; can contain non-alphas
  output: string with every even index uppercase
              every odd index lowercase
              non-alphas unchanged
Data
  character array?
Algo:
  downcase whole string
  iterate with index
  uppercase even indices
=end

# def staggered_case(string)
#   string.downcase.chars.each_with_index do |char, index|
#     char.upcase! if index.even?
#   end.join
# end

def staggered_case(string, start_2nd=false)
  p (string.downcase.chars.each_with_index do |char, index|
    if start_2nd
      char.upcase! if index.odd?
    else
      char.upcase! if index.even?
    end
  end.join)
end

p staggered_case('I Love Launch School!', true)
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'