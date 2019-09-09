=begin
problem: prompt the user for a noun, verb, adverb and adjective. 
interpolate words in a sentence with the variables placed in the correct order.
output that string.

input: prompt user for string objects 

output: new string with values interpolatoin

algorithm:
prompt user for a noun
assign string to a local variable
prompt user for a verb
assign string for a verb
prompt user for an adverb
assign string to a local variable adverb
prompt user for an adjective
assign string to a local variable adjective

interpolate string with variables placed in position: 
"Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"

questions:
do I have to validate input?

=end

def message(msg)
  puts "Enter a #{msg}: "
end

message('noun')
noun = gets.chomp

message('verb')
verb = gets.chomp

message('adjective')
adjective = gets.chomp

message('adverb')
adverb = gets.chomp

template_one = "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!."
template_two = "#{noun.capitalize} don't #{verb}, just because #{adjective} #{noun} can be #{adjective}."
template_three = "#{noun.capitalize} #{adverb} #{verb}, maybe I am not making sense. Should I say #{adjective} #{noun}?"

puts([template_one, template_two, template_three].sample)




