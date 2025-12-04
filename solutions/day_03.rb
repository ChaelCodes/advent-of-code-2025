# frozen_string_literal: true

class Day03
  attr_accessor :records, :part

  PARSE_REGEX = /.*/

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
      record.chars
    end
  end

  def max_joltage(battery_bank, total_cells)
    return "" if total_cells == 0
    first_digit = battery_bank[0..-total_cells].max
    first_index = battery_bank[0..-total_cells].index(first_digit)
    "#{first_digit}#{max_joltage(battery_bank[(first_index+1)..], total_cells - 1)}"
  end

  def solve_part_1
    parse_records
    records.map { |battery_bank| max_joltage(battery_bank, 2).to_i }.sum
  end

  def solve_part_2
    parse_records
    records.map { |battery_bank| max_joltage(battery_bank, 12).to_i }.sum
  end

  def solve
    if part == 1
      solve_part_1
    else
      solve_part_2
    end
  end
end