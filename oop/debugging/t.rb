class Dog
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name=(newish)
    @name = newish
    newish.upcase!
  end


end

teddy = Dog.new("hello")
# teddy.enable_swimming
# puts teddy.swim                                  # => nil
# puts teddy::swim

# teddy.name = "ok"
# puts teddy.name

case Dog
when Dog
  puts "dog"
end


