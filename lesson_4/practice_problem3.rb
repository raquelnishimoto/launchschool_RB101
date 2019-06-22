ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p less_years_members = ages.reject { |_, v| v >= 100 }

p ages.delete_if { |_, value| value >= 100 }