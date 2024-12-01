# frozen_string_literal: true

require_relative 'test_helper'

class TestBaseSolver < Minitest::Test
  def test_each_line
    File.write('test/fixtures/example.txt', "1\n2\n3\n4")
    solver = BaseSolver.new('test/fixtures/example.txt')

    assert_equal [1, 2, 3, 4], solver.each_line.map(&:to_i)

    File.delete('test/fixtures/example.txt')
  end

  def test_not_implemented_errors
    solver = BaseSolver.new('test/fixtures/day01_test.txt')

    assert_raises(NotImplementedError) { solver.solve_part_1 }
    assert_raises(NotImplementedError) { solver.solve_part_2 }
  end
end
