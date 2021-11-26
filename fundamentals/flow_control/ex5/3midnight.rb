# def after_midnight(time)
#   if time == '24:00' || time == '00:00'
#     0
#   else
#     digits = time.chars
#     hours = (digits[0].to_i * 10)  + digits[1].to_i
#     minutes = (digits[3].to_i * 10)  + digits[4].to_i
#     minute = hours * 60 + minutes
#   end
# end

# def before_midnight(time)
#   if time == '24:00' || time == '00:00'
#     0
#   else
#     1440 - after_midnight(time)
#   end
# end

HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

