def number?(value)
  value.to_i.to_s == value
end

# determines if a string is a numeric string between 0 and 255.
def an_ip_number?(element)
  element.to_i >= 0 && element.to_i <= 255
end

def valid_ip?(input)
  input.each do |word|
    break if number?(word) == false || an_ip_number?(word) == false
  end
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  dot_separated_words.size == 4 && valid_ip?(dot_separated_words) ? true : false
end

p dot_separated_ip_address?("30.4.5.12")