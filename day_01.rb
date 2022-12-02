def sum_max(input, n)
  input.split("\n\n").map { |g| g.split("\n").map(&:to_i).sum }.max(n).sum
end
input = File.read("day_01_input.txt")
puts sum_max(input, 1)
puts sum_max(input, 3)
