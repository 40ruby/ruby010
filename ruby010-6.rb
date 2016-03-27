#!/usr/bin/env ruby
# coding: utf-8
# filename: ruby010-2.rb

require './ruby010-5.rb'

if ARGV.size > 0 then
  file_name = ARGV[ARGV.size - 1]
  open_file(file_name)
else
  abort "usage: ${PROGRAM_NAME} <filename>"
end

case file_name
when /.*csv$/ then
  read_csv.each { |line|
    p line
  }
when /.*tsv$/ then
  read_tsv.each { |line|
    p line
  }
when /.*ssv$/ then
  read_tsv.each { |line|
    p line
  }
when /.*json$/ then
  read_json.each { |line|
    p line
  }
else
  p "対象外のファイルです"
end

close_file
