# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides
# must be greater than the length of the longest side, and all sides must have lengths greater than 0:
# if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments,
# and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether
# the triangle is equilateral, isosceles, scalene, or invalid.

=begin
Problem
  input: three numbers, representing sides of a triangle
          can be floats, ints, or 0
          no negatives in tests
  output:
    symbol, representing the type of triangle,
      equi: all 3 sides equal
      isosc: 2 sides equal
      scal: no sides are equal
      invalid: 2 shortest sides < longest side

Algorithm:
  check for valid triangle
    create a sorted array
    boolean check: sum of of 1st and 2nd elements is > third element
  if s1 == s2
    if s2 == s3
      equilateral
    else
      isosceles
    end
  if s1 != s2 && s2 != s3
    scalene
  end
=end

def valid_triangle?(s1, s2, s3)
  sorted_sides = [s1, s2, s3].sort
  sorted_sides[0..1].sum > sorted_sides[2]
end

def triangle(s1, s2, s3)
  return :invalid unless valid_triangle?(s1, s2, s3)

  if s1 == s2 && s2 == s3
    :equilateral
  elsif s1 == s2 || s2 == s3 || s1 == s3
    :isosceles
  else
    :scalene
  end
end

# LS
def triangle(side1, side2, side3)
  sides = [side1, side2, side3]
  largest_side = sides.max

  case
  when 2 * largest_side > sides.reduce(:+), sides.include?(0)
    :invalid
  when side1 == side2 && side2 == side3
    :equilateral
  when side1 == side2 || side1 == side3 || side2 == side3
    :isosceles
  else
    :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
