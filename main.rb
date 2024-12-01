#!/usr/bin/env ruby
# frozen_string_literal: true

require 'pathname'
require 'clipboard'

$LOAD_PATH.unshift(File.expand_path('./lib', __dir__))

def main
  puts 'Enter the day (e.g., 01, 02, ...):'
  day = gets.chomp

  class_name = "Day#{day}"
  begin
    require class_name.downcase
    solver_class = Object.const_get(class_name)
  rescue LoadError, NameError
    puts "Day #{day} is not implemented. Exiting."
    exit 1
  end

  input_file = Pathname.new("./input/day#{day}.txt")
  unless input_file.exist?
    puts "Input file for Day #{day} not found: #{input_file}"
    exit 1
  end

  solver = solver_class.new(input_file.to_s)

  puts 'Which part? (1 or 2):'
  part = gets.chomp.to_i
  unless [1, 2].include?(part)
    puts "Invalid part: #{part}. Please enter 1 or 2."
    exit 1
  end

  method_name = "solve_part_#{part}"
  if solver.respond_to?(method_name)
    result = solver.public_send(method_name)
    puts "Solution for Day #{day}, Part #{part}: #{result}"

    Clipboard.copy(result)
    puts 'The solution has been copied to your clipboard.'
  else
    puts "Solver does not implement #{method_name}."
    exit 1
  end
end

main if __FILE__ == $PROGRAM_NAME
