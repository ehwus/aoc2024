# frozen_string_literal: true

require_relative 'test_helper'

class TestDay01 < Minitest::Test
  def test_class_exists
    assert Object.const_defined?('Day01')
  end

  def test_proper_initialization
    solver = Day01.new('test/fixtures/day01_test.txt')

    assert solver.respond_to?(:each_line)
    assert solver.respond_to?(:solve_part_1)
    assert solver.respond_to?(:solve_part_2)
  end
end
