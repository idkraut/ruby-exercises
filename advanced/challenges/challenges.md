# Easy
## 1 Triangles
- `ArgumentError` should be raised in `initialize` method if invalid triangle
  - we want this to happen upon instantiation of new `Triangle` object, not after
    - otherwise, you can create invalid triangles
  - put `raise` after initializing ivars so you can use the side values in validation methods
- makes sense to store sides in an array
  - can use array methods later
  - type with `array.uniq.size`
  - `sides.min > 0`
  - indexing for valid triangle a little more cumbersome, but still clear
## 2 Hamming
- getter method not really needed here
- you're getting there fairly easily but being a little sloppy
  - use this to practice good method, PEDAC
## 3 Romans
- brutish way works and doesn't depend on order, but the hash is way too big
  - this kind of thinking probably wouldn't scale very well, seems less programmatic
- LS approach
  - store only the necessary conversions
    - each letter and the combo of one before
      - in descending order
  - iterate through the hash
    - if number is divisible by hash value
      - add that many of the letter to the roman string
      - update number by subtracting the value you just built
      - `divmod` facilitates this
        - int division tells you how many times to write letter
        - remainder updates the number
    - else, go to the next k,v pair
- think more efficiently about how input and output relate
  - what do I know about this type of data?
  - how do different collection types and methods help me manipulate this type?
  - try to isolate what is needed
  - i saw that there was redundancy in my code, but didn't follow through to resolve it
  - practice refactoring now, practice good methods now

## 5 Scrabble
- strings have `include?` method; no need for arrays here
- not necessary, but interesting to note LS use of
   `word.upcase.gsub(/[^A-Z]/, '').chars`
   - `gsub` here uses regex to convert all non-alphabetic characters to empty strings
- class methods can take advantage of instance methods by instantiating within the class method and calling relevant instance methods on that object

## 6 perfect numbers
- `num % divisor == 0` is all you need to see if `divisor` is a factor of `num`

## 7 Octal
- improvements from LS solution
  - `string.to_i.digits` is more efficient than using `map`
  - `num.chars.all? {|n| n =~ /[0-7]/}` is a bit clearer
    - `=~` returns falsey `nil` if no match found, so it's useful in `all?` to see if any char isn't in the required range
      - if not a match, block evaluates as `false` and `all?` returns `false`
- probably better practice to pass args to validation methods instead of using ivar there
  - clearer functionality
  - seems easier to expand if needed
    - eg maybe the class takes more than one value

## 8 Sum of multiples
- you can't call instance methods on a class, even if they are defined in that class
  - but you can instantiate a new object and call instance method on it to avoid logic duplication
  - can't use splat with default parameter value
  - `@multiples = (multiples.size > 0) ? multiples : [3, 5];`
    - one way to assign default value to potential list of args
    - this is important for this exercise
      - my solution didn't actually assign default value for instances
      - passed tests because this scenario wasn't included, but LS solution covers it
- `any_multiple?` with `select` is a bit clearer to read

## 9 beer song
- `\` can be used for line continuation
  - tells ruby that next line is part of the same string
  - similar to performing concatenation with `+`
    - though `\` means same string, so binding happens first with any methods
      - if you called a method at the end using `\`, it would apply to whole string
      - if you called after concatenations with `+`, it would apply only to last string
- cleaner to extract verses to their own methods
  - main method becomes a simple conditional
- don't use keywords like `end` as variables or method names

## 10 series
- `each_cons` is an array method! you can convert each char to a digit and then use it on that array
  - calling `to_a` on `each_cons` will give each series as a subarray, as the problem requests
- Ruby automatically removes leading 0 when converting string to int
  - integers with leading 0 are octal
  - here, we need to convert each char to int and then use each_cons
- i wrote my own each_cons, which was good practice, but not necessary
  - also, kind of overcomplicated
  - using length as an arg makes things clearer
  - last idx is just total_length - sub_length
  - iterate from 0 idx to last idx, taking sub_length size slices

# Medium
## diamond
- be careful about off by 1 errors!
  - test yourself; is this really the right index? use real values, confirm
  - twice today you've gotten mixed up
    - remember index will be the position - 1
    - and integer division doesn't round up, it just cuts off the decimal
    - int division by 2 on an odd number gives the middle index

## Clock
- when you overwrite, be very aware of return values
  - eg when overriding `+`, I initially just added to `@minutes`
    - but this returned that new `@minutes` value
    - so if we call this outside the class, we get that return value
      - so it isn't doing what we want, which is to return a clock object with the correct minutes
    - `+` should generally return a new object of the same type
      - in this case, a new `Clock` object with the appropriate minutes
  - never understimate mistaking `=` for `==`
    - let's go over it again
      - `=` is for assignment
      - `==` is for comparison
- `format` sequence looks like `%[flags][width][precision]type`, followed by args that correspond to the `%`
  - a lot more in the docs, but I think I finally get the basics
    - `%02d, hour` doesn't have a precision indicator
      - it has a `0` flag to pad with zeroes instead of spaces
      - it has a `2` for the width indicator
      - it has `d` to indicate type decimal
      - `hour` is the arg value used in the formatting signified between `%` and `d`
- LS solution organizes things differently, but does most of the same thing
  - revisit this later to think more about design tradeoffs

## Meetup
- LS solution is more logical and concise
- mine works fine but is a bit convoluted and inefficient
- good here to narrow down what's possible in each solution
  - eg if you're looking for the first of some day, it has to be between 1-7
    - so we look for the specified day only within the possible range
      - instead of looking through the entire month
    - also good is iterating through a range and using the numbers from the range as args for `day` parameter
      - we pass `day` into `Date.civil` to iterate through calendar days
      - `next` works, but not as controlled or clear
        - gives extra things to keep track of
  - for the last `x`day of the month,
      def first_day_to_search(schedule)
        SCHEDULE_START_DAY[schedule] || (@days_in_month - 6)
      end
      - we set `last` key to `nil` in constant lookup hash, and we use `||` in the method so that when the key is `nil`, which is falsey, the second part is executed, which sets the range to the last 7 days

- `Enumerable#detect` returns first element for which the block returns a truthy value
  - aliased as `find`

## SimpleLinkedList
- LS solution makes different use of constructor and attr methods
- doesn't bother storing entire list, just tracks the current head
- I think this is meant to be more realistic to how linked lists behave
  - makes the implementation of other methods a bit trickier to implement
  - good mental exercise
- but given the requirements, I dont see much advantage to it
  - maybe this is an illustration that you should aim to model things accurately
  - not just have them pass tests
  - thinking about it, sort of redundant to use an array structure
    - which feels more like an improvement of a simple linked list
  - structuring it LS way seems to get more at foundational ideas
