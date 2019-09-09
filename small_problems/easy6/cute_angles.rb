MIN_DEGREE = 60
SEC_MIN = 60
DEGREE = "\xC2\xB0"

def degrees(num)
  num.to_i % 360
end

def minutes(num)
  (num - num.to_i) * MIN_DEGREE
end

def seconds(num)
  (num - num.to_i) * SEC_MIN
end

def dms(float_number)
  format_degrees = "#{degrees(float_number)}#{DEGREE}"
  format_minutes = "#{format('%02d', minutes(float_number).to_i)}'"
  format_seconds = "#{format('%02d', seconds(minutes(float_number)))}\""
  "#{format_degrees}#{format_minutes}#{format_seconds}"
end

p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")
p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00") || dms(254.6) == %(254°35'59")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
