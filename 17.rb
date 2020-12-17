require "set"

run = ->xs, times {
  dimensions = xs[0].size

  offsets = (n = [-1, 0, 1]; n.product(*([n] * (dimensions - 1))) - [[0] * dimensions])

  around = ->xs {
    offsets.map { |ys| xs.zip(ys).map(&:sum) }
  }

  times.times.reduce xs.to_set do |xs, _|
    xs.flat_map(&around).uniq.filter_map do |nx|
      count = around.(nx).count { |x| xs.include?(x) }
      nx if count == 3 || count == 2 && xs.include?(nx)
    end.to_set
  end
}

xs = $<.read.split("\n").flat_map.with_index do |line, i|
  line.chars.filter_map.with_index do |ch, j|
    [i, j] if ch == "#"
  end
end

p run.(xs.map { |x| [0] + x }, 6).count
p run.(xs.map { |x| [0, 0] + x }, 6).count
