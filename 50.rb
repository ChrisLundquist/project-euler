#!/usr/bin/env ruby
require 'prime'
#The prime 41, can be written as the sum of six consecutive primes:

#41 = 2 + 3 + 5 + 7 + 11 + 13
#This is the longest sum of consecutive primes that adds to a prime below one-hundred.

#The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

#Which prime, below one-million, can be written as the sum of the most consecutive primes?
primes = Prime.each(1_000_000).to_a
targets = primes.select { |i| 999_000 < i && i < 1_000_000 }
puts targets.inspect
# puts primes.size

# Bisection + guess and check :/
#candidate = primes[3..545].sum
candidate = primes[3..545].sum
puts candidate
puts candidate.prime?
