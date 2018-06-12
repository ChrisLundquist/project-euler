#!/usr/bin/env ruby

SCORE = ('A'..'Z').each_with_index.reduce(Hash.new) { |acc, (el, i)| acc[el] = i + 1; acc }

data = File.read("22.txt").split

def score(name)
  name.each_char.sum { |c| SCORE[c] }
end

total_scores = data.map.with_index do |name, index|
  score(name) * (index + 1)
end
puts total_scores.sum
