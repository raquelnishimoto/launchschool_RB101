arr = ['10', '11', '9', '7', '8']
# ['11', '10', '9', '8', '7']

desc = arr.sort do |ele1, ele2|
  ele2.to_i <=> ele1.to_i
end

p desc