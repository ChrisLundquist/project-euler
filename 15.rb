#!/usr/bin/env ruby

#def lower_bound(digits)
#  eval "0b#{"0" * digits}#{"1" * digits}"
#end

#def upper_bound(digits)
#  eval "0b#{"1" * digits}#{"0" * digits}"
#end
#
#def solutions(range, popcount)
#  range.count { |i| i.to_s(2).count("1") == popcount}
#end
#
#2.upto(14) do |i|
#  range = (lower_bound(i)..upper_bound(i))
#  answer = solutions(range, i)
#  puts [i, answer, answer.to_s(2)].inspect
#end

options = [0] * 20 + [1] * 20
puts options.combination(20).size
