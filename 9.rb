#!/usr/bin/env ruby
#
AREA = 1000
target = (200..500).to_a.combination(3).find { |a,b,c| a < b && b < c && a + b + c == AREA && a**2 + b**2 == c**2}
puts target.inspect
puts target.reduce(1, :*)
