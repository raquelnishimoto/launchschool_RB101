flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hash_flintstones = flintstones.each_with_object(new_hash = {}) do |element|
  new_hash[element] = flintstones.index(element)
end

new_flintstones = {}
index = 0
loop do
  break if index == flintstones.size
  new_flintstones[flintstones[index]] = index
  index += 1
end

p hash_flintstones
p new_flintstones