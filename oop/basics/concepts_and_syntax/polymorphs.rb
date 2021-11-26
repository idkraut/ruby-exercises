module Swimmable
  def swim
    puts "Swimming"
  end
end

class Animal
  def talk
    puts "[can't speak]"
  end
end

class Dog < Animal
  include Swimmable

  def talk
    puts "Woof!"
  end

  def play
    puts "Fetch"
  end
end

class Cat < Animal
  def talk
    puts "Meow!"
  end

  def play
    puts "Red Dot"
  end
end

class Fish < Animal
  include Swimmable
end

dog = Dog.new
cat = Cat.new
fish = Fish.new

[dog, cat, fish].each do |critter|
  critter.talk
end

[dog, cat].each do |critter|
  critter.play
end

[dog, fish].each do |critter|
  critter.swim
end

#fish.play # would raise an error if this line ran
#cat.swim  # would raise an error if this line ran

# This code uses all 3 ways to produce polymorphic behavior:

# dogs, cats, and fish all inherit the talk method from Animal.
# fish use the default talk method inherited from Animal (polymorphism via inheritance)
# dogs and cats override the talk method with their own (polymorphism via inheritance--or is it?)
# dogs and cats can both play, fish cannot. (polymorphism via duck typing)
# dogs and fish can both swim, cats cannot. (polymorphism via mixin)
# Polymorphism via mixins is nearly identical to polymorphism via duck typing.
# The only difference is how we add the polymorphic methods to the classes.
# In the end, inheritance is not involved in letting the various objects respond to the play and swim methods.

# There is one corner case with polymorphism via inheritance:
#   what happens if a subclass overrides an inherited method?
#   Is that still polymorphism via inheritance? Or is it polymorphism via duck typing?
#   To my way of thinking, you can make a case either way.
#     On one hand, all Animal objects can use the talk method because they all inherited it;
#     the fact that Dog and Cat overrode the method doesn't change the fact that dogs and cats already respond to the method.
#     On the other hand, overriding the methods does change how dogs and cats respond, so maybe inheritance is irrelevant here.
#     I wouldn't worry about it - I don't see that there's a clear answer.