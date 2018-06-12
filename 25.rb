#!/usr/bin/env ruby

fib = Enumerator.new do |yielder|
  i = 0
  j = 1
  loop do
    i, j = j, i + j
    yielder.yield i
  end
end

sequence = fib.take_while { |n| n.digits.size <= 1000 }

target = sequence.find { |n| n.digits.size == 1000 }
puts target
puts target.digits.size

puts sequence.find_index(target) + 1 # zero vs one based index
