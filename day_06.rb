def sop_offset(signal, size)
  (0...(signal.length - size)).each do |n|
    return n + size if signal[n...(n + size)].chars.uniq.length == size
  end
end

signal = File.read('day_06_input.txt', chomp: true)
puts sop_offset(signal, 4)
puts sop_offset(signal, 14)
