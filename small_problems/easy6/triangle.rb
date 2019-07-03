def triangle(num)
  star = '*'
  spaces = ' '
  num.times do |iteration|
    num -= 1
    puts "#{spaces * num}#{star * iteration}"
  end
end

def triangle_down(num)
  star = '*'
  spaces = ' '
  num.times do |iteration|
    num -= 1
    puts "#{star * num}#{spaces * iteration}"
  end
end

triangle(9)
triangle_down(9)