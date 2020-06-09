require "simplecov"
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require './lib/enigma'
require './lib/christopher'

class ChristopherTest < MiniTest::Test
  def setup
    christopher = Christopher.new
  end

  def test_it_can_find_shift_for_crack
    @christopher.make_msg_array("vjqtbeaweqihssi")
    @christopher.make_alphabet
    assert_equal ([5, 5, 14, 8]), @christopher.find_shift
  end

  def test_it_can_crack_encryption_with_predictable_end_and_date
    @christopher.crack("vjqtbeaweqihssi", "291018")
    assert_equal ("hello world end"),
    @christopher.shifted_msg
  end

  def test_it_can_find_key_for_crack

  end
end
