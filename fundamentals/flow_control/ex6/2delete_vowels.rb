=begin
Problem
  input: array of strings
  output: array of same string values, but with vowels removed
Data:
  array of strings
Algo:
  transform each element of array
    for each string, delete vowels
=end

VOWELS = %w(a e i o u)

def remove_vowels(string_array)
  string_array.map do |str|
    str.delete('aeiouAEIOU')
  end
end


p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
