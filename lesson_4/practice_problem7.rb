statement = "The Flintstones Rock"

# classic loop
statement_array = statement.split(%r{\s*})

char_idx = 0
letters_count = {}

loop do
  break if statement_array.size == char_idx
  current_char = statement_array[char_idx]

  item_idx = 0
  count = 0

  loop do
    break if statement_array.size == item_idx
    count += 1 if current_char == statement_array[item_idx]
    item_idx += 1
  end

  letters_count[statement_array[char_idx]] = count
  char_idx += 1
end

p letters_count

# built-in methods
def example(statement_array)
  statement_array.each_with_object(char_count = {}) do |char|
    char_count[char] = statement_array.count(char)
  end
end

p example(statement_array)

