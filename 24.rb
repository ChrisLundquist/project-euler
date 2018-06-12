#!/usr/bin/env ruby
#
puts (0..9).to_a.permutation.take(1_000_000).last.join
