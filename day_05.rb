def move_crate(stacks, amount, from, to, over_9000)
  if over_9000
    stacks[to].push(*stacks[from].pop(amount))
  else
    amount.times do
      stacks[to].push(stacks[from].pop)
    end
  end
end

def split_file(filename)
  top_lines, bottom_lines = File.read(filename).split("\n\n").map { _1.split("\n") }
  [top_lines, bottom_lines]
end

def new_stacks(top_lines)
  stacks = Hash.new { |hash, key| hash[key] = [] }
  stack_numbers, stack_lines = [top_lines.last, top_lines[...-1]]
  stack_offsets = stack_numbers.to_enum(:scan, /\d+/).map do
    [Regexp.last_match.to_s, Regexp.last_match.offset(0)[0]]
  end.to_h
  stack_lines.reverse.each do |stack_line|
    stack_offsets.each do |stack_number, offset|
      value = stack_line[offset]
      stacks[stack_number].push(value) if value && value != " "
    end
  end
  stacks
end

def modify_stacks!(stacks, bottom_lines, over_9000)
  bottom_lines.each do |line|
    amount, from, to = line.scan(/\d+/)
    move_crate(stacks, amount.to_i, from, to, over_9000)
  end
  stacks
end

# Part 1
top_lines, bottom_lines = split_file('day_05_input.txt')
stacks = new_stacks(top_lines)
modify_stacks!(stacks, bottom_lines, false)
puts stacks.values.map(&:last).join()

# Part 2
top_lines, bottom_lines = split_file('day_05_input.txt')
stacks = new_stacks(top_lines)
modify_stacks!(stacks, bottom_lines, true)
puts stacks.values.map(&:last).join()

# lines = File.readlines("day_05_input.txt", chomp: true).map do |line|
#   line.chars.each_slice(SLICE_SIZE).map { || }
# end
# stacks = input[0].split().each_slice(SLICE_SIZE).map { |group| }
# steps = input[1].split("\n")
