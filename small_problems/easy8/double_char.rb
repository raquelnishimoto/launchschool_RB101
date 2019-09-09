=begin
problem: Write a method that takes a string, and returns a new string in which every character is doubled.

input: string

output: new string

rules:
empty strig will return empty string
all chars will be doubled - including nun alphanumeric

algorithm:
loop through the string
multiple each char by 2
push to new string
return the new string with doubled values

algorithm double consonant
condition - if regex /[a-zA-Z]/

=end

def repeater(string)
  new_string = ''

  string.each_char do |char|
    new_string << char * 2
  end
  new_string
end

def double_consonants(string)
  new_string = ''

  string.each_char do |char|
    new_string << char.gsub(/[[^aeiou]&&[^\W]&&[^\d]]/, char * 2)
  end

  new_string
end

repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
