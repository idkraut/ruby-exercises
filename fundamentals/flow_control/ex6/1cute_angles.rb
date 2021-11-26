=begin
  input: float between 0 and 360
  output: string
          represents degree, minutes, seconds
  Data:
    floats
    divmod array?
    string with interpolation
  Algo:
    determine degrees
      quotient of float / 1
    determine minutes
      convert remainder to fraction out of 60
        multiply remainder by 60
    determine seconds
      remainder of minutes / 1
      multiply by 60
    print string with interpolated values
=end


# DEGREE = "\xC2\xB0"

# def dms(degree)
#   degrees, minutes = degree.divmod(1)
#   minutes = (minutes.round(2) * 60)
#   seconds = (minutes % 1)
#   seconds = (seconds.round(2) * 60)

#   minutes = minutes.to_i
#   seconds = seconds.to_i

#   degrees = "0" + degrees.to_s if degrees < 10
#   minutes = "0" + minutes.to_s if minutes < 10
#   seconds = "0" + seconds.to_s if seconds < 10
#   puts "#{degrees}#{DEGREE}#{minutes}'#{seconds}\""
# end

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end


puts dms(76.73)
p dms(360)
p DEGREE