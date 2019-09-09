=begin
Problem: Write a method that returns 2 times the number provided as an argument,
unless the argument is a double number;

input: integer

output: new object - integer

rules: 
A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits.
For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.
what happens if number is 0?

algorithm:
convert number to string
check if number size is even
if yes, get half of the string and compare with the other half
if two halves are equal then number is double
else convert string to number
and multiple it to 2
=end

def twice(number)
  string = number.to_s
  first_half = string[0, string.size / 2]
  second_half = string[string.size / 2, string.size - 1]

  if string.size % 2 == 0 && string[first_half] == string[second_half]
    number 
  else
    number * 2
  end

end

p twice(3)
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
