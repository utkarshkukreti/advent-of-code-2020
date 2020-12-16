xs = [7, 12, 1, 0, 16, 2]

map = xs.zip(1..).to_h

last = xs.last
(xs.size + 1..).each do |i|
  next_ = (pl = map[last]) ? i - pl - 1 : 0
  map[last] = i - 1
  p next_ if i == 2020
  (p next_; break) if i == 30_000_000
  last = next_
end
