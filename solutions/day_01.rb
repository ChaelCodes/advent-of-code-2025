# frozen_string_literal: true

class Day01
  attr_accessor :records, :part

  PARSE_REGEX = /(?<direction>\w)(?<clicks>\d+)/

  def initialize(part: 1)
    self.records = inputs
    self.part = part
  end

  def inputs
    day_match = self.class.name.match(/Day(?<number>\d+)/)
    begin
      File.readlines("./inputs/day_#{day_match[:number]}.txt", chomp: true)
    rescue Errno::ENOENT
      return []
    end
  end

  def parse_records
    self.records.map! do |record|
      PARSE_REGEX.match(record)
    end
  end

  def solve_part_1
    parse_records
    position = 50
    zero_count = 0
    records.each do |record|
      clicks = record[:clicks].to_i % 100
      new_position = record[:direction] == "L" ? position -= clicks : position += clicks
      while new_position < 0 || new_position >= 100 
        new_position = new_position < 0 ? 100 + new_position : new_position - 100
      end
      position = new_position
      zero_count += 1 if position.zero?
    end
    zero_count
  end

  def solve_part_2
    parse_records
    position = 50
    zero_count = 0
    records.each do |record|
      clicks = record[:clicks].to_i % 100
      rounds = record[:clicks].to_i / 100
      zero_count += rounds
      new_position = record[:direction] == "L" ? position - clicks : position + clicks
      while new_position < 0 || new_position >= 100 
        new_position = new_position < 0 ? 100 + new_position : new_position - 100
        zero_count += 1 unless new_position.zero? || position.zero?
      end
      position = new_position
      zero_count += 1 if position.zero?
    end
    zero_count
  end

  def solve
    if part == 1
      solve_part_1
    else
      solve_part_2
    end
  end
end