#substrings.rb

=begin
problem: return a colection of substrings from the original string.

input: a string

output: a new array, containing substrings from the input string

algorithm:
there will be two loops
first loop will go through the string,
get the first element,
increment each following element by one
in each increment push substring to a new array

increment the initial element by one 
until count == string.size

=end

def substrings_at_start(count, string)
  return_array = []
  count.upto(string.size-1) do |index|
    return_array << string[count..index]
  end
  return_array
end

def substrings(string)
  return_array = []
  count = 0

  loop do
    return_array << substrings_at_start(count, string)
    count += 1
    break if count == string.size
  end
  return_array.flatten
end

p substrings('abcde')
p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
