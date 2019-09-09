# Build a program that displays when the user will retire and how many years she has to work till retirement

def prompt(message)
  puts "==> #{message}"
end

prompt("What's your age? ")
age = gets.chomp.to_i

prompt("At what age would you like to retire? ")
retire_age = gets.chomp.to_i

year = Time.now.year
year_birth = year - age
retire_year = year_birth + retire_age

prompt("It's #{year}. You will retire #{retire_year}.")
prompt("You have #{retire_age - age} years of work to go!")
