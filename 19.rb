#!/usr/bin/env ruby

require 'date'
start_date = Date.parse("1/1/1901")
end_date = Date.parse("31/12/2000")
puts (start_date..end_date).count { |d| d.day == 1 && d.sunday?}
