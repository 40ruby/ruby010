#!/usr/bin/env ruby
# coding: utf-8
# filename: ruby010-4.rb

require './ruby010-3.rb'

if ARGV.size > 0 then
  file_name = ARGV[ARGV.size - 1]
  case file_name
  when /.*csv$/ then
    fp = File_CSV.new(file_name)
  when /.*tsv$/ then
    fp = File_TSV.new(file_name)
  when /.*ssv$/ then
    fp = File_TSV.new(file_name)
  else
    abort "対象外のファイルです"
  end
else
  abort "usage: ${PROGRAM_NAME} <filename>"
end

fp.read.each { |line|
  p line
}

fp.close
