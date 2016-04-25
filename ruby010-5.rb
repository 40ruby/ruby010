#!/usr/bin/env ruby
# coding: utf-8
# filename: ruby010-5.rb
require 'json'

def open_file(filename)
  begin
    $fp = File.open(filename)
  rescue => e
    abort "#{e.class} => #{e.message}"
  end
end

def read_file(del)
  result = $fp.each_line.map { |line|
    line.chop.split(del)
  }
  return result
end

def read_csv()
  csv = read_file(',')
  return csv
end

def read_tsv()
  tsv = read_file(' ')
  return tsv
end

def read_ssv()
  ssv = read_file(' ')
  return ssv
end

def read_json()
  json = []
  JSON.load($fp).each do |list|
    json.push([list['date'],list['avg'],list['max'],list['min']])
  end
  return json
end

def close_file()
  $fp.close
end
