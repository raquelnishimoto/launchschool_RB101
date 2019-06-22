def number_valid?(num)
  num.to_i.to_s == num
end

def get_numbers(order)
  number = ''
  loop do
    puts("Enter the #{order} number: ")
    number = gets.chomp
    break if number_valid?(number)
    puts("Please, enter a valid number - bigger than 0.")
  end
  number
end

def last_number_in_list?(list_of_numbers)
  list_of_numbers[0..4].include?(list_of_numbers[5])
end

numbers = []
index = 0
order = %w(1st 2nd 3rd 4th 5th last)
loop do
  numbers << get_numbers(order[index])
  index += 1
  break if index == 6
end

list_numbers = numbers[0..4]
last_number = numbers[5]

if last_number_in_list?(numbers)
  puts("The #{last_number} number appears in #{list_numbers}")
else
  puts("The #{last_number} does not appear in #{list_numbers}")
end
