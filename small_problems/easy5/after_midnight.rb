def hours_negative(number)
  total_hour = number / 60
  total_hour > 24 ? 23 - (total_hour % 24) : 23 - total_hour
end

def hours_positive(number)
  total_hours = number / 60
  if total_hours == 0
    total_hours % 60
  elsif total_hours > 24
    total_hours % 24
  else
    total_hours
  end
end

def minutes_negative(minutes)
  min = minutes % 60
  60 - min
end

def minutes_positive(minutes)
  minutes % 60
end

def positive?(num)
  num >= 0
end

def get_hours(number)
  positive?(number) ? hours_positive(number.abs) : hours_negative(number.abs)
end

def get_minutes(number)
  positive?(number) ? minutes_positive(number.abs) : minutes_negative(number.abs)
end

def time_of_day(number)
  hour = format('%02d', get_hours(number))
  minutes = format('%02d', get_minutes(number))
  "#{hour}:#{minutes}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"