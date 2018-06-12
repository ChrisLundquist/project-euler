#!/usr/bin/env ruby

puts (1..100).reduce(1, :*).digits.sum
