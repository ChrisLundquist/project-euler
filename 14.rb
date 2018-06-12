#!/usr/bin/env ruby
#
@chains = Hash.new

def collatz(int)
  #@chains[int] ||= calculate_chain(int)
  calculate_chain(int)
end

def calculate_chain(int)
  #chain = @chains.key?(int) ? [int] + chains[int] : [int]
  chain = [int]
  next_term = chain.last
  loop do
    next_term = next_collatz_term(next_term)
    chain << next_term
    break if next_term == 1
  end

  #unless @chains.key?(chain.first)
  #  clone = chain.dup
  #  clone.size.times do
  #  term = clone.shift
  #    @chains[term] = clone
  #  end
  #end

  chain
end

def next_collatz_term(int)
  int.even? ? (int / 2) : (3 * int + 1)
end

best = (1..1_000_000).max_by { |i| collatz(i).size }
puts best.inspect
puts collatz(best).inspect

#puts @chains.inspect
