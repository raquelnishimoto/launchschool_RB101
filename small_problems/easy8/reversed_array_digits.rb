=begin
problem: Write a method that takes a positive integer as an argument and returns that number with its digits reversed.

input: integer

output: integer

rules:
no leading zeros on return value

data:

algorithm:
convert integer to string - to_s
reverse string
replace all leading zeros with '' by using regex /^0+/
convert string to integer

=end

def reversed_number(integer)
  integer.to_s.reverse.gsub(/^0+/,'').to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1
