arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

sorted = arr.map do |array|
  array.sort do |ele1, ele2|
    ele2 <=> ele1
  end
end

p sorted