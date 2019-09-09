def word_cap_one(string)
  capitalised_words = []
  string.downcase.split(' ').map do |word|
    capitalised_words << word.capitalize
  end
  capitalised_words.join ' '
end

def word_cap_two(string)
  capitalised_words = []
  string.downcase.split(' ').map do |word|
    capitalised_words << word.gsub(word[0], word[0].upcase)
  end
  capitalised_words.join ' '
end

def word_cap(string)
  capitalized_string = []
  string.downcase.split(' ').map do |word|
    capitalize = word.split('')
    capitalize[0].replace(capitalize[0].upcase)
    capitalized_string << capitalize.join
  end
  capitalized_string.join' '
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
