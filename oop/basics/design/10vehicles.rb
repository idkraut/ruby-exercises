# class Car
#   attr_reader :make, :model

#   def initialize(make, model)
#     @make = make
#     @model = model
#   end

#   def wheels
#     4
#   end

#   def to_s
#     "#{make} #{model}"
#   end
# end

# class Motorcycle
#   attr_reader :make, :model

#   def initialize(make, model)
#     @make = make
#     @model = model
#   end

#   def wheels
#     2
#   end

#   def to_s
#     "#{make} #{model}"
#   end
# end

# class Truck
#   attr_reader :make, :model, :payload

#   def initialize(make, model, payload)
#     @make = make
#     @model = model
#     @payload = payload
#   end

#   def wheels
#     6
#   end

#   def to_s
#     "#{make} #{model}"
#   end
# end

module Wheelable
  def wheels
    
  end
end

class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end

civic = Car.new(1999, "civic")
puts civic.wheels