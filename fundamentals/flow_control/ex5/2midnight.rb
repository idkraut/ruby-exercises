# input: integer
  # minutes before or after midnight
    # negative if before, positive if after
# output: string
  # in military 00:00 format, shows time of day
  # should work with any integer input
# data structures
  # ?
# algorithm
  # what minute of the day?
    # number mod (24 * 60)
  # convert minute of the day to 00:00

MINUTES_PER_DAY = 1440

# def convert_to_military_time(minute)
#   hours, minutes = minute.divmod(60)
#   time = ''
#   if hours < 10
#     time << ('0' + hours.to_s + ':')
#   else
#     time << (hours.to_s + ':')
#   end
#   if minutes < 10
#     time << ('0' + minutes.to_s)
#   else
#     time << minutes.to_s
#   end
#   time
# end

def time_of_day(delta_minutes)
  minute_of_day = delta_minutes % MINUTES_PER_DAY
  hours, minutes = minute_of_day.divmod(60)
  format('%02d:%02d', hours, minutes)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# MINUTES_PER_HOUR = 60
# HOURS_PER_DAY = 24
# MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

# def normalize_minutes_to_0_through_1439(minutes)
#   while minutes < 0
#     minutes += MINUTES_PER_DAY
#   end

#   minutes % MINUTES_PER_DAY
# end

# def time_of_day(delta_minutes)
#   delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
#   hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
#   format('%02d:%02d', hours, minutes)
# end