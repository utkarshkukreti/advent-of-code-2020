require "set"

set = $<.read.split("\n").map(&:to_i).to_set

p1 = set.each do |a|
  b = 2020 - a
  break a * b if set.include?(b)
end

p2 = set.to_a.combination(2).each do |a, b|
  c = 2020 - a - b
  break a * b * c if set.include?(c)
end

p p1, p2
