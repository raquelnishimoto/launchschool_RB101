# Print the even numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

# option 1
max_number = 99

while max_number > 1
  puts max_number - 1
  max_number -= 2
end

# option 2
(1..99).to_a.select do |num|
  puts num if num.even?
end

# option 3
min_number = 1

while min_number < 100
  puts min_number += 1
  min_number += 2
end