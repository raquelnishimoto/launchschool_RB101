collection = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

sum_one = collection.map do |element|
  increment_hash = {}
  element.each_pair do |key, value|
    increment_hash[key] = value + 1
  end
  increment_hash
end

p sum_one
p collection