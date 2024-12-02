# frozen_string_literal: true

require_relative 'base_solver'

class Day02 < BaseSolver
  def solve_part_1
    each_line.filter { |row| row_safe?(row) }.count
  end

  def solve_part_2; end

  private

  def row_safe?(row)
    numbers = row.split(' ').map(&:to_i)

    direction = row_direction(numbers)
    return false if direction.nil?

    last_number, *numbers = numbers
    safe = true

    numbers.each do |n|
      unless safe_transition?(last_number, n, direction)
        safe = false
        break
      end

      last_number = n
    end

    safe
  end

  def safe_transition?(a, b, direction)
    return false if (a - b).abs > 3

    if direction == :up
      b > a
    elsif direction == :down
      a > b
    end
  end

  def row_direction(row_numbers)
    row_numbers[0] > row_numbers[1] ? :down : :up
  end
end
