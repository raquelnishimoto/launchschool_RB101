require 'time'

MINUTES_HOUR = 60
MINUTES_DAY = 1440

def after_midnight(time_string)
  time = Time.parse(time_string)
  (time.hour * MINUTES_HOUR) + time.min
end

def before_midnight(time_string)
  delta_minutes = MINUTES_DAY - after_midnight(time_string)
  delta_minutes = 0 if delta_minutes == MINUTES_DAY
  delta_minutes
end


p after_midnight('00:00') == 0 # => true
p before_midnight('00:00') == 0 # => true
p after_midnight('12:34') == 754 # => true
p before_midnight('12:34') == 686 # => true
p after_midnight('24:00') == 0 # => true
p before_midnight('24:00') == 0 # => true