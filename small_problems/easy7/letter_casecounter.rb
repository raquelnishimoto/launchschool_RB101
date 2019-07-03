def letter_case_count(string)
  counter = Hash.new
  counter[:lowercase] = string.count("a-z")
  counter[:uppercase] = string.count("A-Z")
  counter[:neither] = string.count("^a-zA-Z")
  counter
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }