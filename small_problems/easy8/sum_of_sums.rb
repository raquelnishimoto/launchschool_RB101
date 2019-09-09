=begin
problem:  take an array of numbers with at least one integer; incrementally sum numbers

input: array of numbers

output: new integer object

algorithm:
take array with one of more integers elements
loop through the elements
assign to local variable type array => sum from (element at index 0) up to (current element + 1)
sum all elements in new variable
return this value
=end

def sum_of_sums(array)
new_array = []

  array.each_index do |idx|
    new_array << array.values_at(0..idx).sum
  end
  new_array.sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
