
def double_odd_position(numbers)
  new_numbers = []
  index = 0

  loop do
    break if index == numbers.size
    current_num = numbers[index]
    index.odd? ? new_numbers << current_num * 2 : new_numbers << current_num
    index += 1
  end
  new_numbers
end


my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_position(my_numbers)