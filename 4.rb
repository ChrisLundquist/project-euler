#!/usr/bin/env ruby

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
end

# We know the factors we are looking for are probably in the 900s,
# so generate all the numbers that could be in that range
# Grab only the candidates that are actually palindromes
palindromes = (900**2..999**2).select { |i| i.digits == i.digits.reverse }

# factorize our candidates and grab ones that have two 3 digit factors
palindromes.select! { |i| i.paired_up_factors.any? { |a,b| a.digits.size == 3 and b.digits.size == 3 } }

# Now get the biggest one that meets our constraints
answer = palindromes.max
puts answer
puts answer.paired_up_factors.select { |a,b| a.digits.size == 3 and b.digits.size == 3 }.flatten.inspect
