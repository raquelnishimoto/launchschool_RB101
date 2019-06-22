# Write a program that will ask for user's name.
# The program will then greet the user.
# If the user writes "name!" then the computer yells back to the user.

# my approach to the program
def prompt(message)
  puts("==> #{message}")
end

prompt("What's your name? ")
name = Kernel.gets().chomp()

if name.split('').pop.eql?('!')
  prompt("HELLO #{name.upcase} WHY ARE WE SCREAMING?")
else
  prompt("Hello #{name}.")
end

# Try modifying our solution to use String#chomp! and String#chop!, respectively.

print 'What is your name? '
name = gets.chomp!

if name[-1] == '!'
  name = name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end

