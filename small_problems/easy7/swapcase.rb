def swapcase(string)
  swapped = []
  string.each_char do |char|
    swapped << if char == char.downcase
                 char.upcase
               elsif char == char.upcase
                 char.downcase
               end
  end
  swapped.join
end



p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
