# Write a program that asks the user to enter an integer greater than 0,
# then asks if the user wants to determine the sum or product
# of all numbers between 1 and the entered integer.

def prompt(message)
  puts(">> #{message}")
end

# alternative to calculation method
# def calculation(number, operation)
#   calculation = operation == 's' ? 0 : 1
#   (1..number).to_a.each do |num|
#     if operation == 's'
#       calculation += num
#     else
#       calculation *= num
#     end
#   end
#   calculation
# end

def calculation(number, operation)
  if operation == 's'
  (1..number).inject { |sum, n| sum + n }
  else
    (1..number).inject { |product, n| product * n }
  end
end

number = ''
loop do
  prompt("Please enter an integer greater than 0:")
  number = Kernel.gets().chomp().to_i()
  break unless number < 1
  prompt("Please, enter a valid number.")
end

operation = ''
loop do
  prompt("Enter 's' to compute the sum, 'p' to compute the product.")
  operation = Kernel.gets().chomp()
  break if operation == 's' || operation == 'p'
  prompt("Please, enter a valid operation.")
end

result = calculation(number, operation)
if operation == 's'
  prompt("The sum of the integers between 1 and #{number} is #{result}.")
else
  prompt("The product of the integers between 1 and #{number} is #{result}.")
end