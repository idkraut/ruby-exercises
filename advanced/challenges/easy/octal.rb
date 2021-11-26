=begin
Problem
  input: octal number, given as a string
  output: decimal equivalent, as an integer

Octal class
to_decimal method

Examples/rules:
  invalid input returns 0
  only digits 0-7 are valid chars

Data
  given a string
  need an integer that we build
  array to store input chars, converted to i?

Algorithm
  return 0 if not a valid octal
    false if input contains any char not 0-7
  initialize result to 0
  create an array from each char from input, converted to int, reversed
    iterate through this array
    add element * 8 ** index to result
  return result
=end

class Octal
  attr_reader :octal

  def initialize(octal)
    @octal = octal
  end

  def to_decimal
    return 0 unless valid_octal?
    result = 0
    octal_digits = octal.chars.map(&:to_i).reverse
    octal_digits.each_with_index { |digit, index| result += digit * 8 ** index }
    result
  end

  def valid_octal?
    !octal.match(/[^0-7]/)
  end

end

# LS
class Octal
  attr_reader :number

  def initialize(str)
    @number = str
  end

  def to_decimal
    return 0 unless valid_octal?(number)

    arr_digits = number.to_i.digits

    new_number = 0
    arr_digits.each_with_index do |num, exponent|
      new_number += (num * (8 ** exponent))
    end

    new_number
  end

  private

  def valid_octal?(num)
    num.chars.all? {|n| n =~ /[0-7]/}
  end
end

octal = Octal.new('109')
p octal.valid_octal?

