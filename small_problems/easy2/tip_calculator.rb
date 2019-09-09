#simple tip calculator

def prompt(message)
  puts("=> #{message}")
end

prompt("What's the bill? ")
bill_input = gets.chomp.to_f
prompt("What's the tip percentage (if tip is 15%, put 15 only)? ")
tip_input = gets.chomp.to_f

tip_value = (bill_input * (tip_input / 100)).round(2)
total_bill = (bill_input + tip_value).round(2)

prompt("The tip is #{format('%#.2f', tip_value)}$")
prompt("The bill is #{format('%#.2f', total_bill)}$")
