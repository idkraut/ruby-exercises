require 'Time'
class Vehicle

  attr_accessor :color
  attr_reader :year, :model

  @@instances = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@instances += 1
  end

  def self.instances
    puts @@instances
  end

  def spray_paint(c)
    self.color = c
    puts "Your vehicle is now spray-painted #{color} "
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def age
    "Your #{self.model} is #{years_old} years old"
  end

  private
  def years_old
    Time.now.year - self.year.to_i
  end

end

module Towable
  def can_tow?(pounds)
    pounds < 2000
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4

  def to_s
    "This car is a #{color} #{year} #{model}"
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2

  include Towable

  def to_s
    "This truck is a #{color} #{year} #{model}; it's #{age(year)} years old"
  end
end

civic = MyCar.new(1996, 'silver', 'civic')
tundra = MyTruck.new(1996, 'red', 'tundra')

# civic.speed_up(20)
# civic.current_speed
# civic.speed_up(20)
# civic.current_speed
# civic.brake(20)
# civic.current_speed
# civic.brake(20)
# civic.current_speed
# civic.shut_down
# civic.current_speed

# puts civic.color
# civic.color = 'purple'
# puts civic.color
# puts civic.year
# civic.spray_paint('white')

# MyCar.gas_mileage(13, 351)
# puts civic
# puts tundra
# Vehicle.instances
# puts tundra.can_tow?(4000)
# puts MyCar.ancestors
# puts "----------------"
# puts MyTruck.ancestors
# puts "----------------"
# puts Vehicle.ancestors

# tundra.speed_up(20)
# tundra.current_speed
# tundra.speed_up(20)
# tundra.current_speed
# tundra.brake(20)
# tundra.current_speed
# tundra.brake(20)
# tundra.current_speed
# tundra.shut_down
# tundra.current_speed

# puts tundra.color
# tundra.color = 'purple'
# puts tundra.color
# puts tundra.year
# tundra.spray_paint('white')

# puts tundra.years_old
puts tundra.age
