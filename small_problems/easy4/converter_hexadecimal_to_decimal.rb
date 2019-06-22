# Write a hexadecimal_to_integer method that converts a string
# representing a hexadecimal number to its integer value.
# You may not use any of the standard conversion methods available in Ruby,
# such as String#to_i, Integer(), etc

def map_char
  map = {}
  increment = 10
  (0..9).map do |num|
    map["#{num}"] = num
  end
  ('a'..'f').map do |alpha|
    map["#{alpha}"] = increment
    increment += 1
  end
  map
end

def convert_string_integer!(key)
  map_char[key]
end

def decimal_by_base16(decimal, index)
  decimal * (16**index)
end

def list_of_base16(string)
  index = string.size - 1
  decimals = []
  string.downcase.each_char do |char|
    int = convert_string_integer!(char)
    decimals << decimal_by_base16(int, index)
    index -= 1
  end
  decimals
end

def hexadecimal_to_integer(string)
  list_of_base16(string).inject { |base, num| base + num }
end

p hexadecimal_to_integer('4D9f')
