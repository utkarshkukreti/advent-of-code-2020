n = gets.to_i
xs = gets.split(",").filter_map.with_index { |n, i| (n = n.to_i; [n, (n - i) % n]) if n != "x" }

p xs.map { |x, _| [x, x * (n / x + 1) - n] }.min_by(&:last).reduce(:*)

f = ->a, b, c, d {
  e = (b..).step(a).find { |x| x % c == d }
  [a * c, e]
}

p xs.reduce { |(a, b), (c, d)| f.(a, b, c, d) }.last
