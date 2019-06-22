flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# return a new array with the elements after transformation
index = 0
name_prefix = %w()

loop do
  break if index == flintstones.size
  name_prefix << flintstones[index][0..2]
  index += 1
end

p name_prefix

# method destructively replaces each element in the object it is called on
p flintstones.map! { |item| item.gsub(item, item[0, 3]) }
