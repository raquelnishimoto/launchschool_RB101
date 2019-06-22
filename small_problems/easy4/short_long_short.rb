
def short_long_short(str1, str2)
  one = str1.gsub(/\s+/, '').length
  two = str2.gsub(/\s+/, '').length
  one > two ? "#{str2}#{str1}#{str2}" : "#{str1}#{str2}#{str1}"
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"