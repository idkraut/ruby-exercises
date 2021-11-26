# E1
- can give any class access to most `Enumerable` methods
  - by including `Enumerable` module and defining `each`
- `block_given?` very useful
- `each_cons` iterates through consecutive, overlapping sequences
  - takes arg for length of each subsequence
  - used in #3 along with range to fill in missing numbers in sequence
- when an array is passed to a block
  - you can use one parameter to represent entire array
    - or several paramaters to represent consecutive elements
    - used in #3 solution along with `each_cons`
- square root of a number gives limit of ints to check
  - all factors greater than sq rt are pairs to factors less than sq rt
  - if you've checked ints up to that point
    - you will have all factors
- `reduce` works with string concatenation
  - useful with converting each char and building string from conversions
    - 'memo' value is accumulated
  - this method is looking more versatile than i thought
- some computers use EBCDIC instead of ASCII
  - but this is rare

# E2
- `with_object` can be chained to add object parameter such as an array
  - can make methods more concise
  ``` ruby
  def zipper(array1, array2)
    array1.each_with_index.with_object([]) do |(element, index), result|
      result << [element, array2[index]]
    end
  end
  ```
  - here `result` parameter references array passed as arg to `with_object`
- `map` can be called on a range
  - will still build and return an array based on return values of block
- can have arbitrarily long list of args, treated as an array
  - with `def method(*args)`
- you can pass objects to blocks
  - blocks can mutate those objects with destructive method calls
- `*` also lets you pass each element to a block or method one at a time
- in method def, `*args` takes a list of args and treats them like an array

# Etesting
- can add personal failure message to `assert`
  - `assert(condition), 'failure message'`
- `assert_equal` more generally useful
  - we usually want a specific result
- but sometimes specific assertions are clearer and give better failure messages
  - eg `assert_nil(val)` or `assert_empty(list)`
- `assert_include(collection, inclusion)`
  - collection is first arg
- `Object#kind_of?` tests if arg is instance of class or subclass
  - used by `assert_kind_of`
- `assert_same` uses `#equal?` to see if args are the same object
- most minitest assertions have opposite refute version
  - eg `refute_equal` fails if args are equal
