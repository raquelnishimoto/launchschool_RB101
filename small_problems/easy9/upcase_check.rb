=begin
Problem: Write a method that takes a string argument,
and returns true if all of the alphabetic characters inside the string are uppercase,
false otherwise.

Input: string

Output: boolean

Algorithm:
take argument and convert to upcase
compare this new string to the original argument
it true return true else false
=end

def uppercase?(string)
  string.upcase == string
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

