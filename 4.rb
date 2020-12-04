p1, p2 = 0, 0

$<.read.chomp.split("\n\n").each do |input|
  h = input.split(/\s+/).map { |x| x.split(":") }.to_h
  next unless %w[byr iyr eyr hgt hcl ecl pid].all? { |x| h.include?(x) }
  p1 += 1
  byr = h["byr"].to_i
  next unless byr >= 1920 && byr <= 2002
  iyr = h["iyr"].to_i
  next unless iyr >= 2010 && iyr <= 2020
  eyr = h["eyr"].to_i
  next unless eyr >= 2020 && eyr <= 2030
  m0, m1, m2 = h["hgt"].match(/^(\d+)(cm|in)$/).to_a
  next unless m0
  m1 = m1.to_i
  case m2
  when "cm"
    next unless m1 >= 150 && m1 <= 193
  when "in"
    next unless m1 >= 59 && m1 <= 76
  end
  next unless h["hcl"].match?(/^#[a-f0-9]{6}$/)
  next unless %w[amb blu brn gry grn hzl oth].include?(h["ecl"])
  next unless h["pid"].match?(/^[0-9]{9}$/)
  p2 += 1
end

p p1, p2
