=begin
Problem:
Create a method that takes 2 arguments, an array and a hash.
The array will contain 2 or more elements that,
when combined with adjoining spaces, will produce a person's name.
The hash will contain two keys, :title and :occupation, and the appropriate values.
Your method should return a greeting that uses the person's full name, and mentions the person's title.

input: 
one array, with one or more elements
one hash with title and occupation

output: 
New object of type string - interpolation of input

algorithm:
join array with a space #join
get values in hash and assign them to variables: tittle and occupation
evaluate if tittle starts with vowel
return string with interpolation of values
=end

def greetings(array, hash)
  name = array.join(' ')
  title = hash[:title]
  occupation = hash[:occupation]

  article = title.start_with?(/[aeiou]/i) ? 'an' : 'a'

  "Hello, #{name}! Nice to have #{article} #{title} #{occupation} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
