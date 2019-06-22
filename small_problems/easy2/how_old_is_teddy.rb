# Option 1
puts "What's your name? "
name = gets().chomp()
age = rand(20..200)

def generate_age(name, age)
  name = 'Teddy' if name.empty?
  puts "#{name} is #{age} old!"
end

generate_age(name, age)

# Option 2
def generate_age(name, age)
  puts "#{name} is #{age} old!"
end

def default_name(input)
  if input == ''
    'Teddy'
  else
    input
  end
end

puts "What's your name? "
name = gets().chomp()
age = rand(20..200)

generate_age(default_name(name), age)