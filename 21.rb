#!/usr/bin/env ruby
#Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
#If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.
#For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
#Evaluate the sum of all the amicable numbers under 10000.

class Integer
  def factors
    1.upto(Math.sqrt(self)).select {|i| (self % i).zero?}.inject([]) do |f, i|
      f << i
      f << self / i unless i == self / i
      f
    end.sort
  end

  def paired_up_factors
    a = self.factors
    l = a.length
    midpoint = l % 2 == 0 ? l / 2 - 1 : l / 2
    a.zip(a.reverse)[0..midpoint]
  end

  def amicable_part
    self.factors[0...-1].sum
  end

  def amicable?
    other_half = amicable_part
    other_half != self && other_half.amicable_part == self
  end

  def amicable_pair
    [self, amicable_part] if amicable?
  end
end

amicable_numbers = (0...10000).select { |i| i.amicable? }
puts amicable_numbers.sum
