p1 = 0
p2 = 0

$<.read.strip.split("\n").each do |line|
  _, a, b, c, d = line.match(/^(\d+)-(\d+) (.): (.*)/).to_a
  a, b = a.to_i, b.to_i
  count = d.chars.count { |ch| ch == c }
  p1 += 1 if count >= a && count <= b
  p2 += 1 if (d[a - 1] == c) ^ (d[b - 1] == c)
end

p p1
p p2
