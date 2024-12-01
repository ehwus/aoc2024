require 'minitest/autorun'
require 'pry'
Dir["#{__dir__}/../lib/*.rb"].sort.each { |file| require file }
