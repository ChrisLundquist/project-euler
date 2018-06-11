#!/usr/bin/env ruby

@data = File.read("11.txt").each_line.map { |line| line.split.map { |i| i.to_i } }
def neighbors(x,y)
  [
    [@data[y+0][x+0], @data[y+0][x+1], @data[y+0][x+2], @data[y+0][x+3]], #right  ->
    [@data[y+0][x+0], @data[y+1][x+1], @data[y+2][x+2], @data[y+3][x+3]], # diagonal \
    [@data[y-0][x+0], @data[y-1][x+1], @data[y-2][x+2], @data[y-3][x+3]], # diagnoal /
    [@data[y+0][x+0], @data[y+1][x+0], @data[y+2][x+0], @data[y+3][x+0]], # down
  ]
end

#puts neighbors(0,0).inspect
#puts neighbors(4,2).inspect
#puts neighbors(16,16).inspect

acc = 17.times.reduce(Hash.new) do |acc,y|
  17.times do |x|
    #puts [x,y].inspect
    acc[[x,y]] = neighbors(x,y).map { |group| group.reduce(1, :*) }
  end
  acc
end
puts acc.max_by { |k,v| v.max }.inspect
puts acc.max_by { |k,v| v.max }.last.max
