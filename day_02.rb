def parse_round(line)
  opp, you = line.split(' ')
  [opp.ord - 'A'.ord, you.ord - 'X'.ord]
end

def beat(shape)
  (shape + 1) % 3
end

def beaten_by(shape)
  (shape - 1) % 3
end

def rps_score(opp, you)
  case
  when opp == you then 3
  when beat(opp) == you then 6
  else 0
  end + you + 1
end

def rps_score_2(opp, res)
  case
  when res == 0 then beaten_by(opp)
  when res == 1 then opp
  when res == 2 then beat(opp)
  end + res * 3 + 1
end

rounds = File.read('day_02_input.txt').strip().split("\n").map { |line| parse_round(line) }
puts rounds.map{ |round| rps_score(*round) }.sum
puts rounds.map{ |round| rps_score_2(*round) }.sum
