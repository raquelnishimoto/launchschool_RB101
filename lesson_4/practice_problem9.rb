words = "the flintstones rock"

# Problem: capitalise each word
# input: string
# output: new object string (assumption)

# algorithm: split array where there is a blank space,
# loop through each item in the array
# capitalise items in a new string
# return string

words_split = words.split
capitalized = ''
last_index = 1

words_split.map do |word|
  capitalized += word.capitalize
  capitalized += " " unless words_split.size == last_index
  last_index += 1
end

p capitalized

p words.split.map { |word| word.capitalize }.join(' ')



