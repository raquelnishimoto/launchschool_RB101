# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# displays the result
require 'yaml'

LANGUAGE = 'es'
MESSAGES = YAML.load_file('calculator_messages.yml')
puts MESSAGES.inspect

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

#limitation - it does not handle 0.0 or 00
def valid_number?(number)
  if number == '0'
    true
  elsif number.to_i == 0
    false
  else
    true
  end
end

def operation_to_message(operation)
    action = case operation
             when '1'
               'Adding'
             when '2'
               'Subtracting'
             when '3'
               'Multiplying'
             when '4'
               'Dividing'
             end
    puts("it's true")
  action
end

#verify that only valid numbers -- integers or floats -- are entered
def number?(input)
  value = input.chars()
  if value.include?('.')
    input.to_f
  else
    input.to_i
  end
end

prompt(messages('welcome', LANGUAGE))
name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    puts(MESSAGES["valid_name"])
  else
    break
  end
end

prompt("Hi #{name}!")

loop do
  first_number = ''
  loop do
    prompt(MESSAGES['set_first_number'])
    first_number = Kernel.gets().chomp()
    if valid_number?(first_number)
      break
    else
      prompt('Please, enter a valid number: ')
    end
  end

  second_number = ''
  loop do
    prompt(MESSAGES['set_second_number'])
    second_number = Kernel.gets().chomp()
    if valid_number?(second_number)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  operator_prompt = <<-MSG
 What type of operation would you like to perform
1) add
2) subtract
3) multiply
4) divide
  MSG

  prompt(operator_prompt)
  operation = ''
  loop do
    operation = Kernel.gets().chomp()
    if %w(1 2 3 4 ).include?(operation)
      break
    else
      prompt(MESSAGES['operator_error'])
    end
  end

  prompt("#{operation_to_message(operation)} the two numbers...")
  result = case operation
           when '1'
             number?(first_number) + number?(second_number)
           when '2'
             number?(first_number) - number?(second_number)
           when '3'
             number?(first_number) * number?(second_number)
           when '4'
             number?(first_number) / number?(second_number)
           else
             prompt('Please, select a valid operation')
           end

  prompt("The result is #{result}")
  prompt(MESSAGES['repeat_calculator'])
  answer = Kernel.gets()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['end_message'])
