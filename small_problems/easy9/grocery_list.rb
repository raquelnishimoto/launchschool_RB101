=begin
problem =
Write a method which takes a grocery list (array) of fruits with quantities
and converts it into an array of the correct number of each fruit

input = ested array => array, with elements that are arrays

output = new array

algorithm = 
get each element in the array
each element is an array itself, then 
get second element and initialise as times the 
first element will be repeated
return new array
=end

def buy_fruit(nested_array)
  nested_array.map { |element| [element[0]] * element[1] }.flatten
end

# option 2
def buy_fruit_two(nested_array)
  new_array = []

  nested_array.map do |element| 
    element[1].times { |_| new_array << element[0]}
  end
  new_array
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
