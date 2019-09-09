# # def stringy(str)
# #   puts str.object_id
# #   str << 'hello'
# # end

# # value = 'hi'
# # puts value.object_id
# # puts stringy(value)
# # puts value
# # puts value.object_id

# def plus(x, y)
#   puts "1. #{x.object_id}"
#   x = x + y
#   puts "2. #{x.object_id}"
# end

# a = 'hi'
# b = plus(a, 'hey')
# puts a # 3
# puts b # 5

# def print_id(number)
#   puts "Inside the method #{number.object_id}"
# end

# num = 33
# puts "Outside the method #{num.object_id}"
# print_id num

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

count = 0
loop do
  puts arr[count]
  count += 1
  break if count == arr.size
end
