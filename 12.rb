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

TriNum = Enumerator.new do |y|
 num, index = 1, 1
 loop do
   y << num
   index += 1
   num += index
 end
end


answer = TriNum.find { |i| i.factors.size >= 500 }
puts answer
puts answer.factors.inspect
