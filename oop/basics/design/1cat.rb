puts "Hello".class
puts 5.class
puts [1, 2, 3].class

module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

meowser = Cat.new("Meowser")
meowser.greet
meowser.name = "Catsablanca"
meowser.greet

meowser.walk