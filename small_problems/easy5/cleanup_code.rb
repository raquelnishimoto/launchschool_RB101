def alpha?(char)
  (('a'..'z').cover?(char) || ('A'..'Z').cover?(char))
end

def cleanup(string)
  clean_string = ''
  string.each_char do |ch|
    if alpha?(ch)
      clean_string << ch
    else
      next if clean_string.end_with?(' ')
      clean_string << ' '
    end
  end
  clean_string
end

p cleanup("---what's my +*& line?")
