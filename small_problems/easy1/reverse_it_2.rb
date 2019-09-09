def reverse_words(input)
  #method will get input, split it and assign it to an array
  #get each word individually and reverse it if word is > 4 char
  array = input.split
  array_size = array.size
  array_reverse = []
  index = 0
  while array_size > 0
    array_reverse << if array[index].length < 5
                       array[index]
                     else
                       array[index].reverse
                     end
    index += 1
    array_size -= 1
  end
  array_reverse.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS