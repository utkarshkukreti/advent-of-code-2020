around = [-1, 0, 1].flat_map { |dx| [-1, 0, 1].map { |dy| [dx, dy] } } - [[0, 0]]

step = ->(grid:, part:) do
  grid.map.with_index do |row, x|
    row.map.with_index do |cell, y|
      occupied = around.count do |dx, dy|
        ({ 1 => 1..1, 2 => 1.. }[part]).each do |i|
          xx = x + dx * i
          yy = y + dy * i
          break unless xx >= 0 && yy >= 0 && xx < grid.size && yy < grid[xx].size
          break grid[xx][yy] if grid[xx][yy] != :floor
        end == :taken
      end
      if cell == :empty && occupied == 0
        :taken
      elsif cell == :taken && occupied >= { 1 => 4, 2 => 5 }[part]
        :empty
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
  end.sum { |ys| ys.count(:taken) }
end

grid = $<.read.split("\n").map do |row|
  row.chars.map do |char|
    { "." => :floor, "L" => :empty, "#" => :taken }[char]
  end
end

p run.(grid: grid, part: 1)
p run.(grid: grid, part: 2)
