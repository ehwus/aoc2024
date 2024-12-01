# frozen_string_literal: true

require_relative 'test_helper'

class TestDay01 < Minitest::Test
  def setup
    @solver = Day01.new('test/fixtures/day01_test.txt')
  end

  def test_class_exists
    assert Object.const_defined?('Day01')
  end

  def test_proper_initialization
    assert @solver.respond_to?(:each_line)
    assert @solver.respond_to?(:solve_part_1)
    assert @solver.respond_to?(:solve_part_2)
  end

  def test_parse_line
    line_result = @solver.send(:parse_line, '3  4')
    assert_equal line_result, [3, 4]

    line_result = @solver.send(:parse_line, '4  3')
    assert_equal line_result, [4, 3]

    line_result = @solver.send(:parse_line, '44234  34234')
    assert_equal line_result, [44_234, 34_234]
  end

  def test_lists
    list1, list2 = @solver.send(:lists)
    assert_equal list1, [1, 2, 3, 3, 3, 4]
    assert_equal list2, [3, 3, 3, 4, 5, 9]
  end

  def test_list_differences
    differences = @solver.send(:list_differences)
    assert_equal differences, [2, 1, 0, 1, 2, 5]
  end

  def test_solve_part_1
    assert_equal @solver.solve_part_1, 11
  end

  def test_occurrences
    occurrences = @solver.send(:occurrences, [1, 1, 1, 2, 2, 2, 2])

    assert_equal occurrences[1], 3
    assert_equal occurrences[2], 4
    assert_equal occurrences[5], 0
  end

  def test_solve_part_2
    assert_equal @solver.solve_part_2, 31
  end
end
