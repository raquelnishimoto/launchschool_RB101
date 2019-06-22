# using classic looping
def running_total_one(numbers)
  list_totals = []
  sum = 0
  index = 0
  loop do
    break if index == numbers.size
    sum += numbers[index]
    list_totals << sum
    index += 1
  end
  list_totals
end

# using inject method from Enumerable
def running_total_two(numbers)
  number = 0
  numbers.inject(list_total = []) do |list_total, num|
    list_total << number += num
  end
end

# using each_with_object method from Enumerable
def running_total(numbers)
  sum = 0
  numbers.each_with_object(list_total = []) do |num|
    list_total << sum += num
  end
end

p running_total([2, 5, 13])
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []