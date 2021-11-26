# =begin
# Problem
#   build a clock
#     can add and subtract minutes

# Clock class
#   ::at
#     takes hour and optional minutes
#       creates an instance of Clock
#       sets time of new instance of clock
#   #to_s
#     uses hour and minutes
#     returns string representation in form '00:00'
#   #+
#     adds minutes
#   #-
#     subtracts minutes
#   addition and subtraction should wrap around per day

# two clock objects with same time should be considered equal
# 24-hour notation seems fine

# Algorithm
#   ::at

# =end

# class Clock
#   HOURS_PER_DAY = 24
#   MINUTES_PER_HOUR = 60
#   MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

#   attr_accessor :hours, :minutes, :total_minutes

#   def self.at(hours, min=0)
#     Clock.new(hours, min)
#   end

#   def initialize(hours, min)
#     @hours = hours
#     @minutes = min
#     @total_minutes = (hours * MINUTES_PER_HOUR) + minutes
#   end

#   def +(additional_minutes)
#     total_min = wrap_around(total_minutes + additional_minutes)
#     new_hours, new_minutes = total_min.divmod(MINUTES_PER_HOUR)
#     Clock.at(new_hours, new_minutes)
#   end

#   def -(additional_minutes)
#     total_min = wrap_around(total_minutes - additional_minutes)
#     new_hours, new_minutes = total_min.divmod(MINUTES_PER_HOUR)
#     Clock.at(new_hours, new_minutes)
#   end

#   def to_s
#     if hours < 10
#       if minutes < 10
#         "0#{hours}:0#{minutes}"
#       else
#         "0#{hours}:#{minutes}"
#       end
#     else
#       if minutes < 10
#         "#{hours}:0#{minutes}"
#       else
#         "#{hours}:#{minutes}"
#       end
#     end
#   end

#   def wrap_around(total_min)
#     total_min % MINUTES_PER_DAY
#   end

#   def ==(other)
#     self.total_minutes = other.total_minutes
#   end
# end

# LS
class Clock
  attr_reader :hour, :minute

  ONE_DAY = 24 * 60

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute=0)
    new(hour, minute)
  end

  def +(add_minutes)
    minutes_since_midnight = compute_minutes_since_midnight + add_minutes
    while minutes_since_midnight >= ONE_DAY
      minutes_since_midnight -= ONE_DAY
    end

    compute_time_from(minutes_since_midnight)
  end

  def -(sub_minutes)
    minutes_since_midnight = compute_minutes_since_midnight - sub_minutes
    while minutes_since_midnight < 0>
      minutes_since_midnight += ONE_DAY
    end

    compute_time_from(minutes_since_midnight)
  end

  def ==(other_time)
    hour == other_time.hour && minute == other_time.minute
  end

  def to_s
    format("%020d:%02d", hour, minute);
  end

  private

  def compute_minutes_since_midnight
    total_minutes = 60 * hour + minute
    total_minutes % ONE_DAY
  end

  def compute_time_from(minutes_since_midnight)
    hours, minutes = minutes_since_midnight.divmod(60)
    hours %= 24
    new(hours, minutes)
  end
end


clock1 = Clock.at(15, 9)
clock2 = Clock.at(1, 36)

puts clock1
puts clock2

# clock = Clock.at(10) - 1440
# # clock2 = Clock.at(11)
# puts clock
# # clock2 + 3
# # puts clock2
# # p clock
# # clock + 3
# # puts clock
