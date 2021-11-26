# D1
- be specific about the methods you're calling and what object you're calling on
  - eg if books is an array of `Book` objects, you may need array methods to access each individual `Book` object before you can call any `Book` methods on those objects
# D2
- be explicit about args passed with `super`
  - num of args passed up needs to match that of superclass method
- don't really need `initialize` method in subclass if superclass does the same thing
# D3
- `BasicObject#==` returns true only if obth objects are the same object
  - need to override for class if you want to do class-specific value comparison with `==`
# D4
- private methods cannot be invoked with an explicit caller, even inside of their own class
  - but you can do this with protected methods
    - and still not be able to call outside class
# D5
- `self.class` can be very useful for explicit namespacing
  - eg where to look for a constant or method
  - also gives flexibility with calling methods
    - can specify which subclass to use
      - important if methods are overriden in subclasses
- some options for this file format example
  - use `self.class` to specify which subclass constant to use
  - create `format` methods in each subclass that return the format
  - use instance variables
    - but this doesn't convey the fact that the format should be fixed
- Ruby already has a `File` class, so no need to build this outside this example
- `Module#alias_method` creates a copy of a method and gives it a new name
  - used to retain access to methods that are overriden

# D6
- sort methods use `<=>`
  - must have this defined in class to call `sort`
- mixing in module `Comparable` gives access to comparison methods
  - must define `<=>(other)` method in class
- when working with floats, don't forget imprecision
  - useful to check comparison using `.abs` and margin of error
  ```ruby
  (Length.new(10, :km).as_nautical_miles.as_kilometers - Length.new(10, :km)).abs < 0.001 # => true
  ```
# D7
- use `attr` methods for their intended purpose
- setters ALWAYS return the argument passed in
  - even if you add explicit return
  - just don't do this
- if you mutate the arg in a setter
  - it will reflect in the assignment
  - even if you do it after
  - ivar will point to that object
    - mutation will reflect in the ivar
- setters and getters must reference ivar explicitly with `@ivar`
  - for some reason I forgot this and called self.name = inside self.name= method body
    - which of course caused a stack overflow from recursion without a break
  - once they're defined, THEN you can just call them
    - must use `self` for setter method call in another method
    - or Ruby thinks you're initializing local var

# D8
- don't forget variable shadowing
- local variables will get precedence
- can distinguish by prepending with `self` to use getters/setters
  - or `@ivar`, though former is preferred

# D9
- be aware of accidental method overriding
  - good practice to give your methods unique and specific names
- don't forget to include modules in the class if you're calling a method on an object of that class
  - Ruby will follow method lookup path if not found
    - and it might find one in superclasses that you don't intend to call

# D10
- don't inherit from Exception
  - too broad; you want Ruby to handle system/environment exceptions
  - usually good practice to inherit from StandardError
- `case` statements with classes may surprise you
  - eg if class `Dog` is the case, `when Dog` will evaluate to false
    - because `case` uses `===`
    - in the example of classes, this tests if `when` clause is an instance of the class
      - not if they are the same class
- if using `rescue`
  - be specific about what you want to handle, why, and how
