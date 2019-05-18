require 'yaml'
MESSAGES = YAML.load_file('loan_calculator.yml')

def messages(message)
  MESSAGES[message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end
#is the number an integer
def integer?(input)
  input.to_i.to_s == input
end

#is the number a float
def float?(input)
  input.to_f.to_s == input
end

#valid number - float or integer? excluding zero value
def valid_value?(input)
  (integer?(input) && input.to_i != 0 || float?(input) && input.to_f != 0.0)
end

#convert to float or integer
def convert_to_number_type(input)
  if float?(input)
    input.to_f
  else
    input.to_i
  end
end

prompt(MESSAGES['welcome'])

loop do
  loan_amount = ''
  loop do
    prompt(MESSAGES['prompt_loan'])
    loan_amount = Kernel.gets().chomp()
    break if valid_value?(loan_amount)
    prompt(MESSAGES['valid_loan_amount'])
  end

# remove the symbol '%' and convert to float
  annual_percentage_rate = ''
  loop do
    prompt(MESSAGES['prompt_apr'])
    annual_percentage_rate = Kernel.gets().chomp()
    break if valid_value?(annual_percentage_rate)
    prompt(MESSAGES['valid_apr'])
  end

  loan_length_years = ''
  loop do
    prompt(MESSAGES['prompt_length_years'])
    loan_length_years = Kernel.gets().chomp()
    break if valid_value?(loan_length_years)
    prompt(MESSAGES['valid_years'])
  end

# Convert the annual rate from percentage to decimal
  annual_rate_in_decimal = convert_to_number_type(annual_percentage_rate) / 100

# divide the annual rate by 12 months
  monthly_interest_rate = annual_rate_in_decimal / 12

# calculate loan duration in months
  loan_length_months = convert_to_number_type(loan_length_years) * 12

#monthly payment
  monthly_payment = convert_to_number_type(loan_amount) *
                    (monthly_interest_rate / (1 - (1 + monthly_interest_rate) ** (-loan_length_months)))

#total interest
  total_interest = (monthly_payment * loan_length_months) - convert_to_number_type(loan_amount)

#total cost
  total_cost = convert_to_number_type(loan_amount) + total_interest


# trim to 2 decimal points
  prompt("Your monthly payment: $#{format('%.2f', monthly_payment)}")
  prompt("Your total interest:$ #{format('%.2f', total_interest)}")
  prompt("Your total cost: $ #{format('%.2f', total_cost)}")

  prompt(MESSAGES['continue_calculation'])
  answer = Kernel.gets().chomp.downcase
  break if answer != 'y'
end
prompt(MESSAGES['end'])