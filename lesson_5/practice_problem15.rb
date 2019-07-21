arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

array_with_even = arr.select do |element|
  element.all? do |_, value|
    value.all?(&:even?)
  end
end

p array_with_even