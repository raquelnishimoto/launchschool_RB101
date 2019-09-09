# Create a method that takes two arguments, multiplies them together, and returns the result.

def multiply(num1, num2)
  num1 * num2
end

# puts multiply(2, 3) == 15

# Using the multiply method from the "Multiplying Two Numbers" problem,
# write a method that computes the square of its argument.
def square(num1)
  multiply(num1, num1)
end

# puts square(5) == 25
# puts square(-8) == 64

# further exploration

def power_of_n(number, power)
  array = [number] * power
  base_number = 1
  array.each do |num|
  base_number = multiply(base_number, num)
  end
  base_number
end

puts power_of_n(2, 6)