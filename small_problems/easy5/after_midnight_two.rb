MINUTES_HOUR = 60
MINUTES_DAY = 24 * 60

def after_midnight(time)
  hours_to_min = time[0..1].to_i * MINUTES_HOUR
  minutes = time[3..4].to_i
  total = hours_to_min + minutes
  total >= MINUTES_DAY ? 0 : total
end

def before_midnight(time)
  total = 1440 - after_midnight(time)
  total >= MINUTES_DAY ? 0 : total
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0