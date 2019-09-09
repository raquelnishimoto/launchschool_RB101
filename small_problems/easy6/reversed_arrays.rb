def reverse_one(list)
  new_list = []
  index = list.size - 1
  loop do
    break if index < 0
    new_list << list[index]
    index -= 1
  end
  new_list
end

def reverse_two(list)
  list.each_with_object(new_array = []) { |element| new_array.unshift(element) }
end

def reverse(list)
  list.inject([]) { |array, element| array.unshift(element) }
end

def reverse!(list)
  right_index = -1
  left_index = 0
  while left_index < list.size / 2
    list[left_index], list[right_index] = list[right_index], list[left_index]
    left_index += 1
    right_index -= 1
  end
  list
end

p reverse([1, 2, 3, 4]) == [4, 3, 2, 1] # => true
p reverse(%w(a b e d c)) == %w(c d e b a) # => true
p reverse(['abc']) == ['abc'] # => true
p reverse([]) == [] # => true

p list = [1, 3, 2] # => [1, 3, 2]
p new_list = reverse(list) # => [2, 3, 1]
p list.object_id != new_list.object_id # => true
p list == [1, 3, 2] # => true
p new_list == [2, 3, 1] # => true