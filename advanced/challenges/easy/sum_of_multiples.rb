=begin
Problem
  input: a natural number; optional set of one or more numbers
          set defaults to (3, 5)
  output: sum of all multiples of numbers from set that are less than num

  Class SumOfMultiples
    optional set arg; default of (3, 5)
  ::to method
    called directly on class without set arg
  #to method
    takes input arg, natural number limit

Data
  array to store set
  array to store multiples

Algorithm
  initialize multiples array
  iterate through numbers 1 - max - 1
    if current_number is a multiple of something in the set, add to multiples array
    sum unique multiples
=end

class SumOfMultiples
  def initialize(*set)
    @set = set
  end

  def self.to(upper_bound)
    SumOfMultiples.new(3, 5).to(upper_bound)
  end

  def to(upper_bound)
    set = @set
    multiples = []

    (1...upper_bound).each do |current_num|
      set.each do |set_num|
        multiples << current_num if current_num % set_num == 0
      end
    end

    multiples.uniq.sum
  end
end

# LS
class SumOfMultiples
  attr_reader :multiples

  def self.to(num)
    SumOfMultiples.new().to(num)
  end

  def initialize(*multiples)
    @multiples = (multiples.size > 0) ? multiples : [3, 5];
  end

  def to(num)
    (1...num).select do |current_num|
      any_multiple?(current_num)
    end.sum
  end

  private

  def any_multiple?(num)
    multiples.any? do |multiple|
      (num % multiple).zero?
    end
  end
end

summy = SumOfMultiples.new
p summy.to(10)