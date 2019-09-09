# Fibonacci Numbers

def find_fibonacci_index_by_length(length)
  fibonacci_numbers = [1]
  curr_num = 1
  prev_num = 0
  index = 1

  loop do
    fibonacci_numbers << curr_num + prev_num
    prev_num = curr_num
    curr_num = fibonacci_numbers[index]
    break if fibonacci_numbers[index].to_s.length >= length
    index += 1
  end
  fibonacci_numbers.size
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
