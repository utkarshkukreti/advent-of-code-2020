around = [-1, 0, 1].flat_map { |dx| [-1, 0, 1].map { |dy| [dx, dy] } } - [[0, 0]]

step = ->(grid:, part:) do
  occupied_around = ->x, y do
    around.count do |dx, dy|
      ({ 1 => 1..1, 2 => 1.. }[part]).each do |i|
        xx = x + dx * i
        yy = y + dy * i
        break unless xx >= 0 && yy >= 0 && xx < grid.size && yy < grid[xx].size
        break grid[xx][yy] if grid[xx][yy] != "."
      end == "#"
    end
  end

  grid.map.with_index do |row, x|
    row.map.with_index do |cell, y|
      o = occupied_around.(x, y)
      if cell == "L" && o == 0
        "#"
      elsif cell == "#" && o >= { 1 => 4, 2 => 5 }[part]
        "L"
      else
        cell
      end
    end
  end
end

run = ->(grid:, part:) do
  loop do
    next_grid = step.(grid: grid, part: part)
    break grid if next_grid == grid
    grid = next_grid
  end.sum { |ys| ys.count("#") }
end

grid = $<.read.split("\n").map(&:chars)

p run.(grid: grid, part: 1)
p run.(grid: grid, part: 2)
