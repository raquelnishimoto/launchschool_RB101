def halvsies(array)
  index1 = 0
  index2 = 1
  new_array = []
  if array.size.odd?
    new_array << array[index1..index2 + 1]
    index1 += 3
    index2 += 3
  end
  if array.size == 0
    new_array << []
  end
  loop do
    if array.size <= 1
      new_array << []
    end
    break if index2 > array.size
    new_array << array[index1..index2]
    index1 += 2
    index2 += 2
  end
  new_array
end


p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5])
p halvsies([5]) == [[5], []]
p halvsies([])
p halvsies([]) == [[], []]
