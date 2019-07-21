arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

#hsh2
p hsh2[:third].key(0)

#hsh1
hsh1['b'][1]

#arr3
arr3[2][:third][0][0]

#arr2
arr2[1][:third][0]

#arr1
arr1.select do |element|
  if element.size == 1
    element == 'g'
  else
    element.map do |item|
      if item.size == 1
        item == 'g'
      else
        item.map do |inner_item|
          inner_item == 'g'
        end
      end
    end
  end
end

#arr1
arr1[2][1][3]
