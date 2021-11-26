class Student
  attr_accessor :name

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected
  def grade
    @grade
  end
end

joe = Student.new("Joe", 98)
bob = Student.new("Bob", 96)
puts joe.better_grade_than?(bob)
