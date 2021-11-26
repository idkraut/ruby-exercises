=begin
Problem

  input: a string of digits; a specified length for series
  output: an array containing subarrays of each consecutive number series of specified length

Examples
  Series class
  #slices method
    subarrays contain integers
  ArgumentError if series length is longer than string

Data
  outer array
  subarrays representing each series
  input string

Algorithm
  find consecutive subseries
    create results array
    initialize idx1 to 0
    idx2 to idx1 + slice_size - 1
    add arrayed slice of idx1..idx2 to results
    increment both idx
    break if idx2 > str_len
  return results

=end

class Series
  def initialize(num)
    @num = num
  end

  def slices(slice_size)
    raise ArgumentError if slice_size > @num.size
    str_each_cons(slice_size)
  end

  def str_each_cons(slice_size)
    results = []
    idx1 = 0
    loop do
      series = []
      (idx1..idx2).each do |index|
        series << @num[index].to_i
      end
      results << series
      idx1 += 1
      idx2 += 1
      break if idx2 >= @num.length
    end
    results
  end
end

# LS
class Series
  attr_accessor :str

  def initialize(str)
    @number_string = str
  end

  def slices(length)
    raise ArgumentError.new if length > number_string.size
    number_string.chars.map(&:to_i).each_cons(length).to_a
  end
end

# Stephen Gontzes
class Series
  def initialize(number)
    @number = number
  end

  def slices(length)
    last_idx = @number.size - length
    raise(ArgumentError) if last_idx.negative?

    slices = []
    (0..last_idx).each do |idx|
      slices << @number[idx, length].chars.map(&:to_i)
    end
    slices
  end
end

# series = Series.new('01234')
# p series.slices(6)