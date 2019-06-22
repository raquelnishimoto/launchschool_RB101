def century_before_refactor(year)
  cent = year % 100 == 0 ? (year / 100) : (year / 100) + 1
  append = cent.to_s.size == 1 ? cent.to_s : cent.to_s[cent.to_s.size - 1]
  last_two_digits = cent.to_s[cent.to_s.size - 2, 2]
  condition = last_two_digits.to_i < 10 || last_two_digits.to_i > 20
  suffix = if append == '1' && condition
             'st'
           elsif append == '2' && condition
             'nd'
           elsif append == '3' && condition
             'rd'
           else
             'th'
           end
  "#{cent}#{suffix}"
end

def century(year)
  century_year = year % 100 == 0 ? (year / 100) : (year / 100) + 1
  "#{century_year}#{suffix(century_year, position(century_year))}"
end

def regular?(century)
  last_two_digits = century.to_s[century.to_s.size - 2, 2]
  century.to_s.size >= 2 && last_two_digits.to_i.between?(11, 13)
end

def position(century)
  century.to_s.size == 1 ? century.to_s : century.to_s[century.to_s.size - 1]
end

def suffix(number, place)
  return 'th' if regular?(number)
  case place
  when '1' then 'st'
  when '2' then 'nd'
  when '3' then 'rd'
  else 'th'
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

p century(2000)
p century(2001)
p century(1965)
p century(256)
p century(5)
p century(10103)
p century(1052)
p century(1127)
p century(11201)