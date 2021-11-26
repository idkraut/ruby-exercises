=begin
Problem
  input: an integer
  output: whether integer is perfect, abundant, or deficient

Examples:
perfect: sum of factors = number
adundant: sum of factors > num
deficient: sum is < num

num is not included as a factor, but 1 is
prime numbers are always deficient

Data:
dealing with ints
probably need an array to store factors

Algorithm
  find all factors
    initialize results as [1]
    from 2 up to sq rt of num
      if current num is evenly divisible
        append current num and num / current num to results
      return unique results
  sum factors
  return appropriate string based on sum and above rules
=end

class PerfectNumber
  def self.valid_number?(number)
    number > 0 && number % 1 == 0
  end

  def self.classify(number)
    raise StandardError unless valid_number?(number)
    sum = valid_factors(number).sum

    if sum == number
      'perfect'
    elsif sum > number
      'abundant'
    else
      'deficient'
    end
  end

  def self.valid_factors(number)
    results = [1]

    2.upto(Math.sqrt(number)) do |current|
      if number % current == 0
        results << [current, number / current]
      end
    end
    results.uniq.flatten
  end
end

