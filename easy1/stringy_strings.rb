#Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1.

def stringy(integer, start = 1)
  string = []
  integer.times do |num|
    string << start if num.even?
    string << 1 - start if num.odd?
  end
  string.join
end

puts stringy(6) == '101010' #=> true
puts stringy(6, 0) #=> 010101
puts stringy(9) == '101010101' #=> true
puts stringy(4) == '1010' #=> true
puts stringy(7) == '1010101' #=> true
puts stringy(7, 0) #=> 0101010