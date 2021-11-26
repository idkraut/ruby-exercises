=begin
Problem
  create a singly linked list
    each element contains data and a 'next' field
      'next' points to the next element in the list
Examples

Element class
  constructor
    takes data, next_element with default of nil
      validate that next_element is Element object?
  #datum method(reader?)
    returns the datum for the element
  #next method
    returns the next element in the linked list
  #tail?
    returns true if next_element is nil
    means it's the last element in list


SimpleLinkedList class
  constructor
    create a list ivar
  #size
    list.size
  #empty?
    list.empty?
  #push
    takes data param
    next_element for new Element is current head of list
    push new Element object to the front of list
  #pop
    probably the opposite of push
    returns removed element's datum
    use array#shift
  #peek
    looks at next elem?
      is nil return gaurd clause best approach for empty list?
    return first element.datum
  #head
    first element of list
  ::from_a
    instantiate new LinkedList
    build a linked list from an array
      return LinkedList if array is nil or empty
      reverse the array
      iterate through and use custom push to add each element to list
      return LinkedList
  #to_a
    iterate through list, build new array using datum from each Element
  #reverse
    reverse list, convert to_a
    return SimpleLinkedList built from reversed array
=end

class SimpleLinkedList
  attr_accessor :list

  def initialize
    @list = []
  end

  def size
    list.size
  end

  def empty?
    list.empty?
  end

  def push(datum)
    next_element = head()
    @list.unshift(Element.new(datum, next_element))
  end

  def peek
    return nil if empty?
    @list[0].datum
  end

  def head
    @list[0]
  end

  def pop
    @list.shift.datum
  end

  def self.from_a(array)
    linked_list = SimpleLinkedList.new

    return linked_list if array == nil || array.size == 0
    array.reverse.each { |el| linked_list.push(el) }
    linked_list
  end

  def to_a
    @list.each_with_object([]) { |element, result| result << element.datum }
  end

  def reverse
    r_list = self.to_a.reverse
    SimpleLinkedList.from_a(r_list)
  end

end

class Element
  attr_reader :datum, :next_element

  def initialize(datum, next_element=nil)
    @datum = datum
    @next_element = next_element
  end

  def tail?
    next_element == nil
  end

  def next
    next_element
  end
end