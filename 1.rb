require "set"

set = $<.read.split("\n").map(&:to_i).to_set

set.any? do |a|
  b = 2020 - a
  p a * b if set.include?(b)
end

set.to_a.combination(2).any? do |a, b|
  c = 2020 - a - b
  p a * b * c if set.include?(c)
end
