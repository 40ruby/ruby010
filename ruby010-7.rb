#!/usr/bin/env ruby
# coding: utf-8
# filename: ruby010-7.rb
require 'json'

class File_CSV
  def initialize(filename)
    begin
      @fp  = File.open(filename)
    rescue => e
      abort "#{e.class} => #{e.message}"
    end
    @del = ','
  end

  def read
    csv = @fp.each_line.map { |line|
      line.chop.split(@del)
    }
    return csv
  end

  def close
    @fp.close
  end
end

class File_TSV < File_CSV
  def initialize(filename)
    super
    @del = ' '
  end
end

class File_SSV < File_CSV
  def initialize(filename)
    super
    @del = ' '
  end
end

class File_JSON < File_CSV
  def read
    json = []
    JSON.load(@fp).each do |list|
      json.push([list['date'],list['avg'],list['max'],list['min']])
    end
    return json
  end
end
