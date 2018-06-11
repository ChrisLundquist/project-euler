#!/usr/bin/env ruby
#
def sum_of_squares(range)
  range.sum { |i| i * i }
end

def square_of_sums(range)
  range.sum * range.sum
end

TARGET = 1..100
puts square_of_sums(TARGET) - sum_of_squares(TARGET)
