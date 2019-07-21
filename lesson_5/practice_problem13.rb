arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]


array_sorted = arr.sort_by do |array|
  array.select(&:odd?)
end

p array_sorted