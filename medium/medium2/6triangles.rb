=begin
Problem:
  input: 3 integers, representing degrees of angles in a triangle
  output: triangle type
            invalid: sum of angles is not 180 or any angles are not greater than 0
            acute: all angles less than 90
            obtuse: one angle greater than 90
            right: one angle equals 90
  no floats, all degrees

Algorithm:
  initialize angles array
  return invalid if sum of angles != 180 or any angle is !> 0

  count array
  return acute if angles less than 90 is 3
  return right if angles == 90 is 1
  return obtuse if exactly one angle is obtuse
=end

def triangle(a1, a2, a3)
  angles = [a1, a2, a3]
  return :invalid if angles.sum != 180 || angles.any? { |angle| !(angle > 0) }

  return :acute if angles.all? { |angle| angle < 90 }
  return :right if angles.count { |angle| angle == 90 } == 1
  return :obtuse if angles.count { |angle| angle > 90 } == 1
end

# LS
def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  case
  when angles.reduce(:+) != 180, angles.include?(0)
    :invalid
  when angles.include?(90)
    :right
  when angles.all? { |angle| angle < 90 }
    :acute
  else
    :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

