xs = $<.read.split("\n").map do |line|
  line.gsub(/F|L/, "0").gsub(/B|R/, "1").to_i(2)
end

p xs.max
p xs.sort.find.with_index { |x, i| x != i + xs.min } - 1
