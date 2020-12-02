p1, p2 = 0, 0

$<.read.strip.split("\n").each do |line|
  _, a, b, c, d = line.match(/^(\d+)-(\d+) (.): (.*)/).to_a
  a, b = a.to_i, b.to_i
  p1 += 1 if d.count(c) >= a && d.count(c) <= b
  p2 += 1 if (d[a - 1] == c) ^ (d[b - 1] == c)
end

p p1, p2
