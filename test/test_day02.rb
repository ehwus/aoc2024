# frozen_string_literal: true

require_relative 'test_helper'

class TestDay02 < Minitest::Test
  def setup
    @solver = Day02.new('test/fixtures/day02_test.txt')
  end

  def test_class_exists
    assert Object.const_defined?('Day02')
  end

  def test_proper_initialization
    assert @solver.respond_to?(:each_line)
    assert @solver.respond_to?(:solve_part_1)
    assert @solver.respond_to?(:solve_part_2)
  end

  def test_row_safe_works_with_same_number_repeated
    refute @solver.send(:row_safe?, '1 1 7 8 9')
  end

  def test_row_safe_returns_false_correctly_upwardly
    refute @solver.send(:row_safe?, '1 2 3 1 2')
  end

  def test_row_safe_returns_true_correctly_upwardly
    assert @solver.send(:row_safe?, '1 2 3 4 5')
  end

  def test_row_safe_returns_false_correctly_downwardly
    refute @solver.send(:row_safe?, '5 4 3 2 6')
  end

  def test_direction
    assert_equal @solver.send(:row_direction, [1, 2, 3]), :up
    assert_equal @solver.send(:row_direction, [3, 2, 1]), :down
  end

  def test_row_safe_returns_true_correctly_downwardly
    assert @solver.send(:row_safe?, '5 4 3 2 1')
  end

  def test_safe_transition?
    assert @solver.send(:safe_transition?, 1, 2, :up)
    assert @solver.send(:safe_transition?, 2, 1, :down)
    refute @solver.send(:safe_transition?, 2, 1, :up)
    refute @solver.send(:safe_transition?, 1, 7, :up)
    refute @solver.send(:safe_transition?, 1, 2, :down)
  end

  def test_solve_part_1
    assert_equal @solver.solve_part_1, 2
  end
end
