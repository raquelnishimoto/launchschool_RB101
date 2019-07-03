def interleave(array1, array2)
  combined_array = Array.new
  array_size = (array1.size + array2.size)
  index1 = 0
  index2 = 0
  array_size.times do |idx|
    if idx.even?
      combined_array << array1[index1]
      index1 += 1
    else
      combined_array << array2[index2]
      index2 += 1
    end
  end
  combined_array
end

def interleave_explore(array1, array2)
  array1.zip(array2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c'])
