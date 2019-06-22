# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise.

def numeric?(input)
  input.to_s.to_i == input
end

def alphabetic?(element)
  ("a".."z").cover?(element)
end

def valid_string(input)
  valid_elements = []
  input_array = input.downcase.split.join.split('')
  input_array.select do |char|
    valid_elements << char if alphabetic?(char)
  end
  valid_elements
end

def real_palindrome?(input)
  if numeric?(input)
    input.to_s.reverse == input.to_s
  else
    valid_string(input).reverse == valid_string(input)
  end
end

# puts real_palindrome?(34543) == true
puts real_palindrome?(0123210) == true
puts real_palindrome?(22) == true
puts real_palindrome?(5) == true
puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false