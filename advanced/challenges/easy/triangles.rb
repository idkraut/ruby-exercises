class Triangle
  attr_reader :s1, :s2, :s3

  def initialize(s1, s2, s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
    raise ArgumentError.new ('Invalid triangle') unless valid_triangle?
  end

  def kind
    if equilateral?
      'equilateral'
    elsif isosceles?
      'isosceles'
    else
      'scalene'
    end
  end

  private

  def equilateral?
    s1 == s2 && s2 == s3
  end

  def isosceles?
    s1 == s2 || s1 == s3 || s2 == s3
  end

  def valid_triangle?
    sides_greater_than_zero? && valid_lengths?
  end

  def sides_greater_than_zero?
    s1 > 0 && s2 > 0 && s3 > 0
  end

  def valid_lengths?
    s1 + s2 > s3 && s1 + s3 > s2 && s2 + s3 > s1
  end
end


# LS
class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
    raise ArgumentError.new "Invalid triangle lengths" unless valid?
  end

  def kind
    if sides.uniq.size == 1
      'equilateral'
    elsif sides.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end

  private

  def valid?
    sides.min > 0 &&
    sides[0] + sides[1] > sides[2] &&
    sides[1] + sides[2] > sides[0] &&
    sides[0] + sides[2] > sides[1]
  end
end