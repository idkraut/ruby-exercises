class Cat
  attr_accessor :name

  COLOR = "purple"

  @@total_cats = 0

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  def initialize(name)
    @name = name
    @@total_cats += 1
  end

  def self.total
    puts @@total_cats
  end

  def identify
    self
  end

  def rename(new_name)
    self.name = new_name
  end

  def personal_greeting
    puts "My name is #{name}!"
  end

  def greet
    puts "Hello! My name is #{name} and I'm a #{COLOR} cat!"
  end

  def to_s
    "I'm #{name}!"
  end
end

Cat.generic_greeting
kitty = Cat.new('mewmew')
kitty.class.generic_greeting

kitty = Cat.new('Sophie')
puts kitty.name
kitty.rename('Meowser')
puts kitty.name

p kitty.identify

kitty.personal_greeting
Cat.total
kitty.greet

puts kitty