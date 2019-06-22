ages = {"Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237}

family_age_sum = ages.map do |_, value|
  value
end

p family_age_sum.sum

ages.each_with_object(sum = 0) do |value|
  sum += value[1]
end

p sum

summing = 0
ages.each_value do |value|
  summing += value
end

p summing
