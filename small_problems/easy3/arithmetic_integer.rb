# Write a program that prompts the user for two positive integers,
# and then prints the results of the following operations on those two numbers:
# addition, subtraction, product, quotient, remainder, and power.

def prompt(message)
  puts("==> #{message}")
end

prompt("Enter the first number: ")
first_number = Kernel.gets().chomp().to_i
prompt("Enter the second number: ")
second_number = Kernel.gets().chomp().to_i

addition = first_number + second_number
subtraction = first_number - second_number
product = first_number * second_number
quotient = first_number / second_number
remainder = first_number % second_number
power = first_number ** second_number

prompt("#{first_number} + #{second_number} = #{addition}")
prompt("#{first_number} - #{second_number} = #{subtraction}")
prompt("#{first_number} * #{second_number} = #{product}")
prompt("#{first_number} / #{second_number} = #{quotient}")
prompt("#{first_number} % #{second_number} = #{remainder}")
prompt("#{first_number} ** #{second_number} = #{power}")
