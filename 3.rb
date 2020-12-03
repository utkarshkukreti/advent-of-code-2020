grid = $<.read.chomp.split("\n")

go = ->dx, dy {
  count = 0
  x, y = 0, 0
  while y < grid.size
    count += 1 if grid[y][x] == "#"
    x += dx
    y += dy
    x %= grid[0].size
  end
  count
}

p go.(3, 1)
p go.(1, 1) * go.(3, 1) * go.(5, 1) * go.(7, 1) * go.(1, 2)
