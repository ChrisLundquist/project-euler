#!/usr/bin/env ruby
#
sum = File.read("13.txt").split.reduce(0) { |acc, line| acc + line.to_i }
puts sum
