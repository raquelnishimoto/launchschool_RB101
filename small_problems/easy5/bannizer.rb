def header(width)
  if width <= 80
    puts "+#{'-' * (width + 2)}+\n|#{' ' * (width + 2)}|"
  else
    puts "+#{'-' * 80}+\n|#{' ' * 80}|"
  end
end

def footer(width)
  if width <= 80
    puts "|#{' ' * (width+ 2)}|\n+#{'-' * (width + 2)}+"
  else
    puts "|#{' ' * 80}|\n+#{'-' * 80}+"
  end
end

def print_in_box(string)
  header(string.size)
  message = ''
  string.each_char do |char|
    message << char
    if message.size >= 78
      puts "| #{message} |"
      message = ''
    end
  end
  footer(string.size)
end

print_in_box('Hello there! To boldly go where no one has gone before.')
print_in_box('')
print_in_box("William Shakespeare (baptized on April 26, 1564 to April 23, 1616) was an English playwright, actor and poet and is often called England’s national poet. Born in Stratford-upon-Avon, England, he was an important member of the Lord Chamberlain’s Men company of theatrical players from roughly 1594 onward. ")
