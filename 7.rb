h = $<.read.split("\n").map do |line|
  first, *rest = line.scan(/(\d )?(\w+ \w+) bags?/).filter_map do |m|
    m[0] ? [m[0].to_i, m[1]] :
      m[1] == "no other" ? nil : m[1]
  end
  [first, rest]
end.to_h

contains = ->k {
  ks = (h[k] || []).map(&:last)
  ks.include?("shiny gold") || ks.any?(contains)
}

p h.keys.count(&contains)

count = ->k {
  (h[k] || []).map do |k|
    k[0] + k[0] * count.(k[1])
  end.sum
}

p count.("shiny gold")
