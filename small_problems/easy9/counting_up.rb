=begin
Problem: Write a method that takes an integer argument,
and returns an Array of all integers, in sequence, between 1 and the argument.

Examples: 1 will return an array with 1 

Rules: assume that the argument will always be a valid integer that is greater than 0.

Input: integer

Output: array

Algorithm: 
1 upto argument type integer 
insert in the new array
return new array
=end

def sequence(number)
result = []
  if number > 0
    1.upto(number) { |num| result << num }
  else
    number.upto(1) { |num| result << num }
  end
  result
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-2)
p sequence(0)
