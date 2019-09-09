require 'time'
require 'date'

TIMEZONE_SEC = 12 * 60 * 60
SEC_IN_MIN = 60

def time_of_day(delta_minutes)
  weekday_index = (delta_minutes / 60) / 24
  weekday = Date::DAYNAMES[weekday_index]
  delta_minutes *= SEC_IN_MIN
  time = Time.at(delta_minutes + TIMEZONE_SEC)
  time.strftime("#{weekday} %R")
end

p time_of_day(0)
p time_of_day(-3)
p time_of_day(35)
p time_of_day(-1437)
p time_of_day(3000)
p time_of_day(800)
p time_of_day(-4231)

p time_of_day(0) == "Sunday 00:00" # => true
p time_of_day(-3) == "Saturday 23:57" # => true
p time_of_day(35) == "Sunday 00:35" # => true
p time_of_day(-1437) == "Saturday 00:03" # => true
p time_of_day(3000) == "Tuesday 02:00" # => true
p time_of_day(800) == "Sunday 13:20" # => true
p time_of_day(-4231) == "Thursday 01:29" # => true