#leading_substrings.rb

=begin
problem: return an array of strings, consisting of a combination of all substrings 
starting from the beginning of a string

input: a string

output: a new object - array with strings as elements

algorithm:
iterate through the string
start at the element at index 0 
increment from index 0 up to current index + 1
push each element in a new array variable
return new array
=end


def substrings_at_start_1(string)
  new_array = string.split('')
  return_array = []

  new_array.each_index do |element|
    return_array << new_array.values_at(0..element).join
  end
  return_array
end

def alphanumeric?(char)
  p char.match?(/[a-zA-Z0-9]/)
end

def substrings_at_start(string)
  return_array = []
  0.upto(string.size-1) do |index|
    if alphanumeric?(string[index])
    return_array << string[0..index]
  end
  end
  return_array
end

p substrings_at_start('-abc')
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
