# frozen_string_literal: true

class BaseSolver
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def each_line
    return enum_for(:each_line) unless block_given?

    File.foreach(file_path) do |line|
      yield line.chomp
    end
  end

  def solve_part_1
    raise NotImplementedError, 'Implement solve_part_1 in your subclass'
  end

  def solve_part_2
    raise NotImplementedError, 'Implement solve_part_2 in your subclass'
  end
end
