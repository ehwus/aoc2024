require 'minitest/autorun'
require 'minitest/pride'
Dir["#{__dir__}/../lib/*.rb"].sort.each { |file| require file }
