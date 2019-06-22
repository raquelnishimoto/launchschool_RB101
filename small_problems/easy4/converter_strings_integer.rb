def map_char()
  map = {}
  (0..9).map do |num|
    map["#{num}"] = num
  end
  map
end

def convert_string_integer!(key)
  map_char[key]
end

def negative?(string)
  string[0] == '-'
end

def strip_sign(string)
  prefix = string[0]
  prefix == '-' || prefix == '+' ? string.delete_prefix!(prefix) : string
end

def absolute_number(input)
  digits = []
  string = strip_sign(input)
  string.each_char do |char|
    digits << convert_string_integer!(char)
  end
  digits.inject { |base, num| base * 10 + num }
end

def string_to_signed_integer(string)
  negative?(string) ? -absolute_number(string) : absolute_number(string)
end


p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100