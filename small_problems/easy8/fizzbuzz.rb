=begin
problem: 
take 2 numbers, the first one representing the starting number and the second the ending number.
loop through the numbers and check if the number is divisible by 3 or 5 or 3 and 5.
if number is disivible by 3 output 'Fizz'
if number is divisible by 5 output 'Buzz'
if number is divisible by 3 and 5 output 'FizzBuzz'
else output number

input: two numbers

output: new object  - string interpolation of results from the condition

rules:
string has output split by comma
input will always be two numbers

data: array

algorithm:
loop through the numbers starting from the first argument
going up to second value passed as aragument
check if the following conditions are fulfilled 
if number is disivible by 3 output 'Fizz'
if number is divisible by 5 output 'Buzz'
if number is divisible by 3 and 5 output 'FizzBuzz'
else output number
push output to new array
join new array with a comma
output result

=end

def fizzbuzz(first_num, last_num)
  new_array = []

  first_num.upto(last_num) do |number|
    new_array << case
                 when number % 3 == 0 && number % 5 == 0 then 'FizzBuzz'
                 when number % 3 == 0 then 'Fizz'
                 when number % 5 == 0 then 'Buzz'
                 else number
    end
  end
  p new_array.join(', ')
end

fizzbuzz(1, 15)
