input = $<.read.split("\n\n")

p input.map { |x| x.gsub("\n", "").chars.uniq.count }.sum

p(input.map do |x|
  x.split("\n").map(&:chars).reduce(:&).count
end.sum)
