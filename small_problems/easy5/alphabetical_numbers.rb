ALPHA_NUMBER = %w(zero one two three four five six seven eight nine ten eleven twelve
                  thirteen fourteen fifteen sixteen seventeen eighteen nineteen)


def alphabetic_number_sort(number_array)
  map_alpha_number = Hash.new
  map_sort = Hash.new(0)
  combine_map = Hash.new
  count = 0
  count_inner = 0
  ALPHA_NUMBER.sort.map do |item|
    map_alpha_number[number_array[count]] = item
    count += 1
  end
  ALPHA_NUMBER.map do |element|
    map_sort[element] = count_inner
    count_inner += 1
  end
  map_alpha_number.each_pair do |num, alpha|
    combine_map[num] = map_sort[alpha]
  end
  combine_map.values
end

p alphabetic_number_sort((0..19).to_a) == [
    8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
    6, 16, 10, 13, 3, 12, 2, 0
]
p alphabetic_number_sort((0..19).to_a)

