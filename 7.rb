h = $<.read.split("\n").map do |line|
  first, *rest = line.scan(/(\d )?(\w+ \w+) bags?/).filter_map do |(a, b)|
    a ? [a.to_i, b] : b == "no other" ? nil : b
  end
  [first, rest]
end.to_h

contains = ->k {
  ks = (h[k] || []).map(&:last)
  ks.include?("shiny gold") || ks.any?(contains)
}

p h.keys.count(&contains)

count = ->k {
  (h[k] || []).map do |(a, b)|
    a + a * count.(b)
  end.sum
}

p count.("shiny gold")
