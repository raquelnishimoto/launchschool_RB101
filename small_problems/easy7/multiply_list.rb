def multiply_list(array1, array2)
  iteration = array1.size
  new_array = Array.new
  iteration.times do |index|
    new_array << array1[index] * array2[index]
  end
  new_array
end

def multiply_list_zip(array1, array2)
  array1.zip(array2).map { |array| array.inject(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

p multiply_list_zip([3, 5, 7], [9, 10, 11])
