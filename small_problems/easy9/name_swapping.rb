=begin 
problem:
Write a method that takes a first name, a space, and a last name passed as a single String argument,
and returns a string that contains the last name, a comma, a space, and the first name.

input = string

output = new string

algorithm:
initialise first name
initialise lest name
interpolate "last name, first name"
=end

def swap_name(string)
  name_array = string.split(' ')
  first_name = name_array[0]
  last_name = name_array[1]

  "#{last_name}, #{first_name}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
