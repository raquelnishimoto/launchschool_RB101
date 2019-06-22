flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# classic looping, returns a string
index = 0
name = nil

loop do
  break if index == flintstones.size
  name = flintstones[index] if flintstones[index].start_with?('Be')
  index += 1
  name
end

p name

# method select returns the element that evaluates to true in a new array object
p flintstones.select { |element| element.start_with?('Be') }