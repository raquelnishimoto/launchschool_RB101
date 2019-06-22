
def multiply(numbers, factor)
  doubled_number = []
  counter = 0

  loop do
    break if counter == numbers.size
    current_number = numbers[counter]
    doubled_number << current_number * factor
    counter += 1
  end
  doubled_number
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3)
