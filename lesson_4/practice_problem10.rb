munsters = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female" },
    "Grandpa" => { "age" => 402, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" },
    "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Option 1
munsters.each_pair do |key, value|
  age_value = munsters[key]["age"]
  value["age_group"] = if age_value > 0 && age_value < 17
                         "kid"
                       elsif age_value > 18 && age_value < 64
                         "adult"
                       else
                         "senior"
                       end
end

p munsters

# Option 2
munsters.each_value do |value|
  age_group = case value["age"]
              when 0..17 then
                "kid"
              when 18..64 then
                "adult"
              else
                "senior"
              end
  value["age_group"] = age_group
end

p munsters
