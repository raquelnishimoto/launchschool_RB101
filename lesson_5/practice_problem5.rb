munsters = {
    "Herman" => {"age" => 32, "gender" => "male"},
    "Lily" => {"age" => 30, "gender" => "female"},
    "Grandpa" => {"age" => 402, "gender" => "male"},
    "Eddie" => {"age" => 10, "gender" => "male"},
    "Marilyn" => {"age" => 23, "gender" => "female"}
}

total_age = 0
munsters.map do |element|
  element.select do |inner_element|
    total_age += inner_element["age"] if inner_element["gender"] == "male"
  end
  total_age
end

p total_age