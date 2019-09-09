def penultimate(sentence)
  size = sentence.split(' ').size
  sentence.split(' ')[size - 2]
end

def middle(sentence)
  size = sentence.split(' ').size
  sentence.split(' ')[size / 2]
end


p penultimate('last word')
p middle('last word')
p middle('Launch School is too great!')
p middle('Launch School is great!')
p middle(' ')