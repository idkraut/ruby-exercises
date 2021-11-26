=begin
Problem
  generate random robot name
  two capital letters followed by 3 decimal digits
  can't repeat

Robot class
we instantiate new robot objects
name attribute and accessors
#reset method
  gives a new name

Data
  class var array to store used names?
  string to build name
  letter constant, digits constant

Algorithm


=end

class Robot
  LETTERS = ("A".."Z").to_a.freeze
  DIGITS = (0..9).to_a.freeze
  @@used_names = []
  attr_reader :name

  def initialize
    @name = generate_name
    @@used_names << @name
  end

  def reset
    @@used_names.delete(@name)
    @name = generate_name
  end

  private

  def generate_name
    loop do
      result = ''
      2.times { result += LETTERS.sample }
      3.times { result += DIGITS.sample.to_s }
      return result unless @@used_names.include?(result)
    end
  end
end

robo = Robot.new
p robo.name