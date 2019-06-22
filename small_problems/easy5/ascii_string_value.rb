def ascii_value(string)
  decimal = string.split('').map do |char|
    char.empty? ? 0 : char.ord
  end
  decimal.sum
end


p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
