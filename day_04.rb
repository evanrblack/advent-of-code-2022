def line_to_ranges(line)
  line.split(',').map { |s| Range.new(*s.split('-').map(&:to_i)) }
end

lines = File.readlines('day_04_input.txt', chomp: true)

puts lines.map{ line_to_ranges _1 }.count { _1.cover?(_2) || _2.cover?(_1) }
puts lines.map{ line_to_ranges _1 }.count { _1.cover?(_2.first) || _2.cover?(_1.first) }
