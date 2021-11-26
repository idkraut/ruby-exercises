class GoodDog
  attr_accessor :name, :height, :weight

  # def initialize(name)
  #   # puts "This object was initialized!"
  #   @name = name
  # end

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  # def get_name
  #   @name
  # end

  # def name
  #   @name
  # end

  # def set_name=(name)
  #   @name = name
  # end

  # def name=(n)
  #   @name = n
  # end

  # def speak
  #   "#{@name} says arf!"
  # end

  def speak
    "#{name} says arf!"
  end

  # def change_info(n, w, h)
  #   @name = n
  #   @height = h
  #   @weight = w
  # end

  # def change_info(n, h, w)
  #   name = n
  #   height = h
  #   weight = w
  #   #won't work
  # end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
    #won't work
  end

  # def info
  #   "#{name} weighs #{weight} and is #{height} tall."
  # end

  def info
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end
end

# sparky = GoodDog.new("Sparky")
# puts sparky.speak
# fido = GoodDog.new("Fido")
# puts fido.speak

# puts sparky.get_name
# # sparky.set_name=("Spartacus")
# sparky.set_name = "Spartacus"
# puts sparky.get_name

# puts sparky.name
# sparky.name = "Spartacus"
# puts sparky.name

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
puts sparky.info

sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info