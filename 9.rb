xs = $<.read.split.map(&:to_i)

window = 25

p1 = (window..).each do |i|
  unless xs[(i - window)...i].combination(2).any? { |ys| ys.sum == xs[i] }
    break xs[i]
  end
end

p2 = (2..).each do |size|
  if ys = xs.each_cons(size).find { |ys| ys.sum == p1 }
    break ys.max + ys.min
  end
end

p p1
p p2
