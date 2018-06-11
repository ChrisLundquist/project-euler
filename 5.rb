#!/usr/bin/env ruby

TARGET = 20
# by definition 20! will be our upper bound as a common multiple
upper_bound = TARGET.downto(1).inject(:*)

# Pull out all our 20s...then our 19s... then our 18s... until we can't
TARGET.downto(2).each do |factor|
  upper_bound /= factor while (TARGET.downto(2)).all? { |i| upper_bound/factor % i == 0 }
  puts upper_bound
end

