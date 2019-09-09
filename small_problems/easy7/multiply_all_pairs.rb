def multiply_all_pairs(array1, array2)
  new_array = Array.new
  array1.map do |element1|
    array2.map do |element2|
      new_array << element1 * element2
    end
  end
  new_array.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]