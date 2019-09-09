def swap(words)
  words_swap = ''
  words.split.map do |word|
    last = word[0]
    first = word[word.size - 1]
    mid = word[1, word.size - 2]
    words_swap << if word.size == 1
                    "#{word} "
                  elsif word.size <= 2
                    "#{first}#{last} "
                  else
                    "#{first}#{mid}#{last} "
                  end
  end
  words_swap.rstrip
end

p swap('Oh what a wonderful day it is')
p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'