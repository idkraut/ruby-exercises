=begin
Meetup class
  constructor takes year and month

  #day method
    input: string for day, string for which day of month
    case insensitive
    output: a new Date object based on input

Algorithm
  #day
    initialize date object
    lookup table for first, second, etc
    use next to iterate through date object
      count input day
      return date if count is desired count
=end
require 'date'

class Meetup
  ORDINALS = {
    'first' => 1,
    'second' => 2,
    'third' => 3,
    'fourth' => 4,
    'fifth' => 5
  }

  def initialize(year, month)
    @year = year
    @month = month
    @date = Date.civil(@year, @month)
  end

  def day(day, ordinal)
    day = day.capitalize
    ordinal = ordinal.downcase

    return last_day(day) if ordinal == 'last'
    return teenth(day) if ordinal == 'teenth'
    return counted(day, ordinal) if ORDINALS.include?(ordinal)
  end

  def counted(day, ordinal)
    count = 1
    ordinal = ORDINALS[ordinal]
    current_day = @date

    loop do
      return nil if current_day.month != @month
      if current_day.strftime("%A") == day
        if count == ordinal
          return current_day
        else
          count += 1
        end
      end
      current_day = current_day.next
    end
  end

  def last_day(day)
    next_month = Date.civil(@year, @month + 1)
    current_day = next_month
    loop do
      current_day = current_day.prev_day
      return current_day if current_day.strftime("%A") == day
    end
  end

  def teenth(day)
    current_day = @date

    loop do
      return current_day if current_day.strftime("%A") == day && (13..19).cover?(current_day.day)
      current_day = current_day.next
    end
  end
end

# LS
class Meetup
  SCHEDULE_START_DAY = {
    'first' => 1,
    'second' => 8,
    'third' => 15,
    'fourth' => 22,
    'fifth' => 29,
    'teenth' => 13,
    'last' => nil
  }.freeze

  def initialize(year, month)
    @year = year
    @month = month
    @days_in_month = Date.civil(@year, @month, -1).day
  end

  def day(weekday, schedule)
    weekday = weekday.downcase
    schedule = schedule.downcase

    first_possible_day = first_day_to_search(schedule)
    last_possible_day = [first_possible_day + 6, @days_in_month].min

    (first_possible_day..last_possible_day).detect do |day|
      date = Date.civil(@year, @month, day)
      break date if day_of_week_is?(date, weekday)
    end
  end

  private

  def first_day_to_search(schedule)
    SCHEDULE_START_DAY[schedule] || (@days_in_month - 6)
  end

  def day_of_week_is?(date, weekday) # rubocop:disable Metrics/CyclomaticComplexity
    case weekday
    when 'monday'    then date.monday?
    when 'tuesday'   then date.tuesday?
    when 'wednesday' then date.wednesday?
    when 'thursday'  then date.thursday?
    when 'friday'    then date.friday?
    when 'saturday'  then date.saturday?
    when 'sunday'    then date.sunday?
    end
  end
end

# meetup = Meetup.new(2013, 4)

# meet = Meetup.new(2001, 9)
# p meet.day('Monday', 'third')