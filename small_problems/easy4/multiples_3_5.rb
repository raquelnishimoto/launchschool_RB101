# Problem: searches for all multiple of 3, 5
# that lie between 1 and the number given
# then computes the sum of these numbers


def multiple?(number, divisor)
  number % divisor == 0
end

def multisum_one(number)
  sum = 0
  (1..number).each do |num|
    sum += num if multiple?(num, 3) || multiple?(num, 5)
  end
  sum
end

def multisum(number)
  multiple_list = %w()
  1.upto(number) do |num|
    if multiple?(num, 3) || multiple?(num, 5)
      multiple_list << num
    end
  end
  multiple_list.inject(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
