def integer_to_string_lazy(integer)
  string = []
  string << (integer * 10) / 10
  string.join
end

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string_option1(integer)
  index = 0
  index_inner = 0
  string = ''
  number_list = []
  number_collection = []
  number_list << integer

  loop do
    number_collection << number_list[index].divmod(10)[1]
    number_list << number_list[index] / 10
    index += 1
    break if number_list[index] == 0
  end
  loop do
    break if index_inner == number_collection.size
    char = DIGITS[number_collection[index_inner]]
    string.prepend('', char)
    index_inner += 1
  end
  string
end

def append_sign(evaluation, num_string)
  if evaluation == 'negative'
    num_string.prepend('-')
  elsif evaluation == 'positive'
    num_string.prepend('+')
  else
    num_string
  end
end

def negative_positive?(number)
  if number < 0
    'negative'
  elsif number > 0
    'positive'
  end
end

def integer_to_string(integer)
  string = ''
  evaluation = negative_positive?(integer)
  loop do
    integer, remainder = integer.abs.divmod(10)
    string.prepend('', DIGITS[remainder])
    break if integer == 0
  end
  append_sign(evaluation, string)
end


p integer_to_string(+4321)
p integer_to_string(0)
p integer_to_string(-5000)
