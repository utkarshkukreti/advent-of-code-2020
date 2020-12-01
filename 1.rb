require "set"

xs = $<.read.split("\n").map(&:to_i).to_set

xs.each do |a|
  b = 2020 - a
  p a * b if xs.include?(b)
end

xs.each do |a|
  xs.each do |b|
    c = 2020 - a - b
    p a * b * c if xs.include?(c)
  end
end
