run = ->xs {
  acc, pc, seen = 0, 0, {}
  loop do
    return [:seen, acc] if seen[pc]
    return [:end, acc] if pc == xs.size
    seen[pc] = true
    a, b = xs[pc]
    case a
    when "acc"
      acc += b
      pc += 1
    when "jmp"
      pc += b
    when "nop"
      pc += 1
    end
  end
}

xs = $<.read.split("\n").map do |input|
  a, b = input.split
  [a, b.to_i]
end

p run.(xs)[1]

(0...xs.size).each do |i|
  xs2 = xs.dup
  a, b = xs2[i]
  xs2[i] = [a == "jmp" ? "nop" : a == "nop" ? "jmp" : a, b]
  r = run.(xs2)
  p r[1] if r[0] == :end
end
