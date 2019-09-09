#Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

def digit_list(value)
  digits = []
  count = 0
  value_string = value.to_s
  value = value_string.length
  while value > 0
    digits << value_string.to_s[count]
    count += 1
    value -= 1
  end
  digits
end

def digit_list(number)
  number.to_s.split('').map(&:to_i)
end


puts digit_list(12345)
puts digit_list(7)
puts digit_list(375290)
puts digit_list(444)