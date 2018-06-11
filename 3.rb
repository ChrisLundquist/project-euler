#!/usr/bin/env ruby
require 'prime'
puts 600851475143.prime_division.max_by { |a,b| a }.first
