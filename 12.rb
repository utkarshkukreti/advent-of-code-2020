part_1 = ->xs do
  e, n, angle = 0, 0, 90

  xs.each do |a, b|
    if a == "F"
      a = { 0 => "N", 90 => "E", 180 => "S", 270 => "W" }[angle % 360]
    end

    case a
    when "N" then n += b
    when "S" then n -= b
    when "E" then e += b
    when "W" then e -= b
    when "L" then angle -= b
    when "R" then angle += b
    end
  end

  e.abs + n.abs
end

part_2 = ->xs do
  e, n = 0, 0
  we, wn = 10, 1

  xs.each do |a, b|
    a, b = "L", 360 - b if a == "R"
    case a
    when "N" then wn += b
    when "S" then wn -= b
    when "E" then we += b
    when "W" then we -= b
    when "L"
      wn, we = case b
        when 90 then [we, -wn]
        when 180 then [-wn, -we]
        when 270 then [-we, wn]
        end
    when "F"
      e += we * b
      n += wn * b
    end
  end

  e.abs + n.abs
end

xs = $<.read.split("\n").map do |line|
  [line[0], line[1..].to_i]
end

p part_1.(xs)
p part_2.(xs)
