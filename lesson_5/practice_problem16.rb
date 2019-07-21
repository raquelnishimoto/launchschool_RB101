def generate_UUID
  alpha_string = Random.new
  hex = []
  code = []
  ('a'..'f').each { |letter| hex << letter }
  (0..9).each { |num| hex << num }

  32.times do |count|
    code << '-' if count == 8 || count == 12 || count == 16
    code << hex[alpha_string.rand(0..15)]
  end
  code.join
end

p generate_UUID