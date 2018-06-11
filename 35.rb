#!/usr/bin/env ruby
# The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#How many circular primes are there below one million?
#
require 'prime'

candidates = [2] + Prime.each(1_000_000).reject { |p| p.digits.any? { |d| d.even? } }

def siblings(int)
  a = int.digits.reverse
  Array.new(a.size).map { |i| a.unshift(a.pop).join.to_i }
end

candidates = candidates.select { |c| siblings(c).all? { |s| s.prime? } }

puts candidates.inspect
puts candidates.count
puts candidates.all? { |c| c.prime? }
