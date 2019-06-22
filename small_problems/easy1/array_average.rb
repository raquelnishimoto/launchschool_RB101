# Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array.
# The array will never be empty and the numbers will always be positive integers.
# Change the return value of average from an Integer to a Float

def average(array)
  total = 0
  array.each do |num|
    total += num
  end
  total.to_f / array.size
end

puts average([1, 5, 87, 45, 8, 8]) == 25.666666666666668
puts average([9, 47, 23, 95, 16, 52]) == 40.333333333333336