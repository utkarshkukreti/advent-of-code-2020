set_bit = ->n, i, b {
  b == 0 ? n & ~(1 << (35 - i)) :
    b == 1 ? n | (1 << (35 - i)) :
    n
}

mask = ""
xs = $<.read.split("\n").filter_map do |line|
  if match = line.match(/mask = (.*)/)
    mask = match[1]
    nil
  elsif match = line.match(/mem\[(\d+)\] = (\d+)/)
    a = match[1].to_i
    b = match[2].to_i
    [mask, a, b]
  end
end

mem = {}
xs.each do |mask, a, b|
  mask.chars.each.with_index do |ch, i|
    b = set_bit.(b, i, 0) if ch == "0"
    b = set_bit.(b, i, 1) if ch == "1"
  end
  mem[a] = b
end
p mem.values.sum

mem = {}
xs.each do |mask, a, b|
  mask.chars.each.with_index do |ch, i|
    a = set_bit.(a, i, 1) if ch == "1"
  end
  recur = ->a, is {
    if i = is[0]
      recur.(set_bit.(a, i, 0), is[1..])
      recur.(set_bit.(a, i, 1), is[1..])
    else
      mem[a] = b
    end
  }
  is = mask.chars.filter_map.with_index { |x, i| i if x == "X" }
  recur.(a, is)
end
p mem.values.sum
