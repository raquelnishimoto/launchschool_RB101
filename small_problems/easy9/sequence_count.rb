=begin
problem:
The method should return an Array that contains the same number of elements as the count argument,
while the values of each element will be multiples of the starting number.

input = two arguments 
first argument is the count
second argument is the starting number

output = array

algorithm = 
1 upto count(argument)
multiple starting number by count
and add to new array
=end

def sequence(count, starting_number)
  (count + 1).times.map { |multiple| starting_number * multiple }[1..count]
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
