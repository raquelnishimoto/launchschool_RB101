=begin
problem:
Write a method that determines the mean (average) of the three scores passed to it,
and returns the letter value associated with that grade.

input: three integers (assume that they are bigger than 0)

output: new string - return value of evaluation

algorithm:
get the mean average by summing three values and dividing by 3
have a method that will return grade - case statement
=end

def get_average(array)
  array.sum / 3
end

def get_grade(num1, num2, num3)
  case get_average([num1, num2, num3])
  when 90..100
    'A'
  when 80..89
    'B'
  when 70..79
    'C'
  when 60..69
    'D'
  else
    'F'
  end
end

p get_grade(95, 90, 93)
p get_grade(50, 50, 95)
p get_grade(80, 80, 80)
p get_grade(10, 20, 30)
