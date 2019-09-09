def show_multiplicative_average(array)
  multiplied = 1.0
  array.each do |num|
    multiplied *= num
  end
  result = format('%.3f', multiplied/array.size)
  "The result is #{result}"
end


p show_multiplicative_average([3, 5])
# The result is 7.500

p show_multiplicative_average([6])
# The result is 6.000

p show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667