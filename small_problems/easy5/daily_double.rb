def crunch(input)
  prev_ch = ''
  remove_duplicates = ''
  input.each_char do |ch|
    prev_ch.eql?(ch) ? remove_duplicates << '' : remove_duplicates << ch
    prev_ch = ch
  end
  remove_duplicates
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
