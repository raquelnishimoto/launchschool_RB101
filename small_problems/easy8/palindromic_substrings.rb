# palindromic substrings

=begin
problem: return polindromes in a string

input: string is one or more chars

output: a new array containing substrings of the string

algorithm:
get array with substrings
loop through all the substrings
take each substring
reverse it
compare substring with reversed substring
if they match push substring to new array


=end

def substrings_at_start(count, string)
  return_array = []
  count.upto(string.size-1) do |index|
    if alphanumeric?(string[count]) && alphanumeric?(string[index])
      return_array << string[count..index]
    end
  end
  return_array
end

def substrings(string)
  return_array = []
  count = 0

  loop do
    return_array << substrings_at_start(count, string)
    count += 1
    break if count == string.size
  end
  return_array.flatten
end

def palindromes(string)
  new_string = string.gsub(/[^a-zA-Z0-9]/, '').downcase
  substrings(new_string).select do |substring|
    substring == substring.reverse && substring.size > 1
  end
end

# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
p palindromes('-hello-madam-did-madam-goodbye')
# p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]
