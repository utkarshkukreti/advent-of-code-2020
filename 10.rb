xs = $<.read.split.map(&:to_i).sort
xs = [0] + xs + [xs.last + 3]

diffs = xs.each_cons(2).map { |a, b| b - a }

p diffs.count(1) * diffs.count(3)

mem = { 0 => 1 }
count = ->x {
  mem[x] ||= xs.include?(x) ? (1..3).sum { |i| count.(x - i) } : 0
}

p count.(xs.last)
