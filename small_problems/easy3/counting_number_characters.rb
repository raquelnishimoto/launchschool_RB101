# Write a program that will ask a user for an input of a word or multiple words
# and give back the number of characters.
# Spaces should not be counted as a character.

puts("Please, enter word or multiple words: ")
input = gets.chomp

sum_length = 0
input.split do |word|
  sum_length += word.length
end

puts("There are #{sum_length} characters in \"#{input}\".")