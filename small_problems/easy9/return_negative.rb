=begin
problem: Write a method that takes a number as an argument. If the argument is a positive number,
return the negative of that number. If the number is 0 or negative, return the original number.

input: number (integer)

output: number (negative integer)

rules/questions: would it take float?
would it take strings? validate valid input?

algorithm:
method has one parameter
argument is evaluated
if bigger than 0
substract 0 - argument
else number should be negative - then return number
=end

def negative(number)
  number > 0 ? 0 - number : number
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0 
