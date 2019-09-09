=begin
problem: Write a method that takes a non-empty string argument, 
and returns the middle character or characters of the argument. 
If the argument has an odd length, you should return exactly one character. 
If the argument has an even length, you should return exactly two characters.

input = non-empty string argument

output = new object - string with middle character(s)

algorithm = 
- take the string size

- check if even
divide size by two 
slice (result - 1.. result)

- check if odd
slice (result)

=end

def center_of(string)

   length = string.size
   center = length / 2

   if length % 2 == 0
    string.slice(center - 1..center) 
  else
   string.slice(center)
 end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'
