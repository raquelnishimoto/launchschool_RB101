hsh = { first: ['the', 'quick'],
        second: ['brown', 'fox'],
        third: ['jumped'],
        fourth: ['over', 'the', 'lazy', 'dog'] }


hsh.map do |_, value|
  value.map do |string|
    string.each_char do |char|
      puts char if char.match(/[aeiou]/i)
    end
  end
end
