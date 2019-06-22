def cleanup(word)
  word.gsub(/[^a-z]/i, '')
end

def word_sizes(string)
  word_size_count = Hash.new
  list_length = string.split.map do |word|
    cleanup(word).size
  end
  list_length.each do |size|
    word_size_count[size] = list_length.count(size)
  end
  word_size_count
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}