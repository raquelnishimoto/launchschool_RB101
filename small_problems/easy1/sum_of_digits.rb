#Write a method that takes one argument, a positive integer, and returns the sum of its digits.

def sum(input)
  sum = 0
  input.to_s.split('').each do |element|
    sum += element.to_i
  end
  sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45