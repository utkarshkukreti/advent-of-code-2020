grid = $<.read.chomp.split("\n")

go = ->dx, dy {
  count = 0
  x, y = 0, 0
  loop do
    x += dx
    y += dy
    x %= grid[0].size
    break unless grid[y]
    count += 1 if grid[y][x] == "#"
  end
  count
}

p go.(3, 1)
p go.(1, 1) * go.(3, 1) * go.(5, 1) * go.(7, 1) * go.(1, 2)
