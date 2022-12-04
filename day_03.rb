def item_priority(item)
  ('A'..'Z').include?(item) ? item.ord - 'A'.ord + 27 : item.ord - 'a'.ord + 1
end

def line_priority(line)
  mid = line.length / 2
  left, right = [line[...mid], line[mid...]]
  item = (left.chars & right.chars).first
  item_priority(item)
end

def group_priority(group)
  item = group.map(&:chars).inject(&:&).first
  item_priority(item)
end

lines = File.readlines('day_03_input.txt', chomp: true)
puts lines.sum { |line| line_priority(line) }
puts lines.each_slice(3).sum { |group| group_priority(group) }
