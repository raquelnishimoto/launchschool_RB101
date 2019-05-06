# using modulus
def is_odd?(value)
  (value % 2) != 0
end

# Numeric#remainder
# def is_odd?(value)
#   value.remainder(2) != 0
# end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true