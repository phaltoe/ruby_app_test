# require_relative 'lib/log_reader'
require_relative 'lib/log_parser'

log = LogParser.new(ARGV[0])

puts "------------------------"
puts "MOST VIEWS"
log.most_views

puts "------------------------"
puts "UNIQUE VIEWS"
log.unique_views