#!/usr/bin/env ruby

#cheating, gem install humanize
require 'humanize'

# remember to strip spaces and dashes
words = 1.upto(1000).sum { |i| i.humanize.gsub(/[ -]/,"").size}
puts words.inspect
