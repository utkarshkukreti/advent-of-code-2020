require "set"

input = $<.read.split("\n\n")

p input.map { |x| x.scan(/[a-z]/).uniq.count }.sum

p(input.map do |x|
  x.split("\n").map do |line|
    line.chars.to_set
  end.reduce(:&).count
end.sum)
