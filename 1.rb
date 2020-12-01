require "set"

xs = $<.read.split("\n").map(&:to_i).to_set

xs.each do |a|
  p a * (2020 - a) if xs.include?(2020 - a)
end

xs.each do |a|
  xs.each do |b|
    p a * b * (2020 - a - b) if xs.include?(2020 - a - b)
  end
end
