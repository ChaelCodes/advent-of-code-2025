# frozen_string_literal: true

class Day02
  attr_accessor :ranges, :records, :part

  PARSE_REGEX = /(\d+)-(\d+)/

  def initialize(part: 1)
    self.records = inputs
    self.ranges = []
    self.part = part
  end

  def inputs
    day_match = self.class.name.match(/Day(?<number>\d+)/)
    begin
      File.read("./inputs/day_#{day_match[:number]}.txt", chomp: true)
    rescue Errno::ENOENT
      return []
    end
  end

  def parse_records
    self.records = records.split(",").map do |record|
      match_data = PARSE_REGEX.match(record)
      [match_data[1].to_i, match_data[2].to_i]
    end
  end

  def generate_ranges
    self.ranges = records.map do |start_num, end_num|
      (start_num..end_num).to_a
    end
  end

  def invalid_ids(range)
    if part == 1
      range.filter { |id| /^(\d+)(\1)$/.match?(id.to_s) }
    else
      range.filter { |id| /^(\d+)(\1)+$/.match?(id.to_s) }
    end
  end

  def solve
    parse_records
    generate_ranges
    self.ranges.sum { |range| invalid_ids(range).sum }
  end
end