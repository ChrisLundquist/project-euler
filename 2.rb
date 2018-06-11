#!/usr/bin/env ruby

fib = Enumerator.new do |yielder|
  i = 0
  j = 1
  loop do
    i, j = j, i + j
    yielder.yield i
  end
end

sequence = fib.take_while { |n| n <= 4E6 }

puts sequence.select { |i| i.even? }.sum
