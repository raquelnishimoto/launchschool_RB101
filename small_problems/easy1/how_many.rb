#Write a method that counts the number of occurrences of each element in a given array.
# case sensitive
# def count_occurrences(items)
#   inventory = {}
#   key_index = 0
#   loop do
#     value_index = 0
#     count = 0
#     loop do
#       inventory[items[key_index]] = count += 1 if items[key_index] == items[value_index]
#       value_index += 1
#       break if value_index == items.length
#     end
#     key_index += 1
#     break if key_index == items.length
#   end
#   inventory.each { |key, value| puts "#{key} => #{value}" }
# end

def count_occurrences(items)
  inventory = {}
  new_items = []
  items.each do |item|
    new_items << item.downcase
  end
  new_items.each do |item|
    inventory[item] = new_items.count(item)
  end
  inventory.each { |key, value| puts "#{key} => #{value}" }
end


vehicles = [
    'car', 'car', 'truck', 'Car', 'SUV', 'truck',
    'motorcycle', 'motorcycle', 'CAr', 'truck'
]

count_occurrences(vehicles)