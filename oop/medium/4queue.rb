class CircularQueue
  attr_accessor :positions, :center, :next_empty, :size
  def initialize(buffer_size)
    @positions = Array.new(buffer_size)
    @center = 0
    @next_empty = 0
    @max = buffer_size - 1
  end

  def dequeue
    return nil if positions[center] == nil
    value = positions[center].clone
    positions[center] = nil
    change_center
    value
  end

  def enqueue(new_item)
    if center == next_empty && positions[next_empty] != nil
      positions[next_empty] = new_item
      change_next_empty
      change_center
    else
      positions[next_empty] = new_item
      change_next_empty
    end
  end

  def change_center
    self.center += 1
    if center > @max
      self.center = 0
    end
  end

  def change_next_empty
    self.next_empty += 1
    if next_empty > @max
      self.next_empty = 0
    end
  end
end

# LS
class CircularQueue
  def initialize(size)
    @buffer = [nil] * size
    @next_position = 0
    @oldest_position = 0
  end

  def enqueue(object)
    unless @buffer[@next_position].nil?
      @oldest_position = increment(@next_position)
    end

    @buffer[@next_position] = object
    @next_position = increment(@next_position)
  end

  def dequeue
    value = @buffer[@oldest_position]
    @buffer[@oldest_position] = nil
    @oldest_position = increment(@oldest_position) unless value.nil?
    value
  end

  private

  def increment(position)
    (position + 1) % @buffer.size
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil