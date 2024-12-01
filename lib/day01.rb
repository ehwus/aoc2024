# frozen_string_literal: true

require_relative 'base_solver'

class Day01 < BaseSolver
  def solve_part_1
    list_differences.sum
  end

  def solve_part_2
    list1, list2 = lists

    occurrences2 = occurrences(list2)

    list1.map do |n|
      n * occurrences2[n]
    end.sum
  end

  private

  def lists
    @lists ||= begin
      list1 = []
      list2 = []

      each_line do |line|
        item1, item2 = parse_line(line)
        list1 << item1
        list2 << item2
      end

      [list1.sort, list2.sort]
    end
  end

  def parse_line(line)
    line.split('  ').map(&:to_i)
  end

  def list_differences
    list1, list2 = lists

    list1.zip(list2).map { |a, b| (a - b).abs }
  end

  def occurrences(list)
    list.each_with_object(Hash.new(0)) do |value, hash|
      hash[value] += 1
    end
  end
end
