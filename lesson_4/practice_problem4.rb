ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# variable minimum_age is assigned the smaller number
array_ages = ages.values
index = 0
minimum_age = 0

loop do
  break if array_ages.size == index
  current_age = array_ages[index]
  minimum_age = current_age if current_age < minimum_age || minimum_age == 0
  index += 1
end
p minimum_age

# method call returns the key, value pair that contains the smaller value
p ages.min { |value1, value2| value1 <=> value2 }

# method call returns the key, value pair that contains the smaller value
p ages.min_by { |_, value| value }