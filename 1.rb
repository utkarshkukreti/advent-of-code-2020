require "set"

xs = $<.read.split("\n").map(&:to_i).to_set

xs.any? do |a|
  b = 2020 - a
  p a * b if xs.include?(b)
end

xs.to_a.combination(2).any? do |a, b|
  c = 2020 - a - b
  p a * b * c if xs.include?(c)
end
