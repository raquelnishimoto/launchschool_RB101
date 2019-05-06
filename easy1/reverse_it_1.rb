#Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

def reverse_sentence(input)
  input_array = input.split
  input_size = input_array.length
  reverse_input = []
  until input_size.zero?
    reverse_input << input_array.pop
    input_size -= 1
  end
  reverse_input.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'