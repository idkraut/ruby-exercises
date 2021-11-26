=begin
Problem
  input: a decimal value (positive integer)
  output: Roman numeral equivalent of input

  requirements:
    don't need to convert > 3000
    each digit is converted left to right, zeroes are ignored
Examples
  no expected errors tested for
  result is a string
Data
  array for digits?
  hash for conversion

Algorithm
initialize roman conversion hash

convert each digit to decimal value
  create digits array
  use index of each position
    skip if 0
    multiply by 10 ** index
    store in an array
      reverse to get greatest to least
iterate through this array, building roman string by converting from hash

=end

class RomanNumeral
  ROMANS = {
    1 => 'I',
    2 => 'II',
    3 => 'III',
    4 => 'IV',
    5 => 'V',
    6 => 'VI',
    7 => 'VII',
    8 => 'VIII',
    9 => 'IX',
    10 => 'X',
    20 => 'XX',
    30 => 'XXX',
    40 => 'XL',
    50 => 'L',
    60 => 'LX',
    70 => 'LXX',
    80 => 'LXXX',
    90 => 'XC',
    100 => 'C',
    200 => 'CC',
    300 => 'CCC',
    400 => 'CD',
    500 => 'D',
    600 => 'DC',
    700 => 'DCC',
    800 => 'DCCC',
    900 => 'CM',
    1000 => 'M',
    2000 => 'MM',
    3000 => 'MMM'
  }

  def initialize(decimal)
    @decimal = decimal
  end

  def to_roman
    roman = ''
    digit_values = composites_array(@decimal)

    digit_values.each do |value|
      roman += convert_to_roman(value)
    end

    roman
  end

  def composites_array(decimal)
    composites = []
    decimal.digits.each_with_index do |digit, index|
      next if digit == 0
      composites << digit * 10 ** index
    end
    composites.reverse
  end

  def convert_to_roman(value)
    ROMANS[value]
  end

end

# LS
class RomanNumeral
  attr_accessor :number

  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_version = ''
    to_convert = number

    ROMAN_NUMERALS.each do |key, value|
      multiplier, remainder = to_convert.divmod(value)
      if multiplier > 0
        roman_version += (key * multiplier)
      end
      to_convert = remainder
    end
    roman_version
  end
end