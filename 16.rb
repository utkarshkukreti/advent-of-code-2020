chunks = $<.read.split("\n\n")

types = chunks[0].split("\n").map do |line|
  _, a, b, c, d, e = line.match(/(.*): (\d+)-(\d+) or (\d+)-(\d+)/).to_a
  [a, b.to_i, c.to_i, d.to_i, e.to_i]
end

your = chunks[1].split("\n").last.split(",").map(&:to_i)

nearby = chunks[2].split("\n").drop(1).map do |line|
  line.split(",").map(&:to_i)
end

p(nearby.flat_map do |nb|
  nb.select do |n|
    types.none? do |ta, tb, tc, td, te|
      n >= tb && n <= tc || n >= td && n <= te
    end
  end
end.sum)

nearby = nearby.select do |nb|
  nb.all? do |n|
    types.any? do |ta, tb, tc, td, te|
      n >= tb && n <= tc || n >= td && n <= te
    end
  end
end

constraints = types.map do |ta, tb, tc, td, te|
  constraint = (0...(nearby[0].size)).select do |i|
    nearby.all? do |nb|
      n = nb[i]
      n >= tb && n <= tc || n >= td && n <= te
    end
  end
  [ta, constraint]
end

solved = {}
loop do
  a, b = constraints.find { |a, b| b.size == 1 }
  solved[a] = b[0]
  constraints = constraints.map do |aa, bb|
    [aa, bb - b]
  end.reject do |a, b|
    b.size == 0
  end
  break if constraints.empty?
end

p(solved.filter_map do |k, v|
  your[v] if k.start_with?("departure ")
end.reduce(:*))
