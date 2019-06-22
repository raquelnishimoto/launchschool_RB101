# Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

# option 1
(1..99).to_a.select do |num|
  puts num if num.odd?
end

# option 2
1.upto(99) do |num|
  puts num if num % 2 != 0
end