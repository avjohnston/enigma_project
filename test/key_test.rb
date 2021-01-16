require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'

class KeyTest < Minitest::Test
  def test_it_exists_and_has_attributes
    key = Key.new
    key2 = Key.new('01234')
    require "pry"; binding.pry
    assert_instance_of Key, key
    assert_equal 5, key.key.length
    assert_equal '01234', key2.key
  end

  # def test_it_can_find_a_rotation
  #   key = Key.new('01234')
  #
  #   assert_equal 1, key.a_rotation
  # end
  #
  # def test_it_can_find_b_rotation
  #   key = Key.new('01234')
  #
  #   assert_equal 12, key.b_rotation
  # end
  #
  # def test_it_can_find_c_rotation
  #   key = Key.new('01234')
  #
  #   assert_equal 23, key.c_rotation
  # end
  #
  # def test_it_can_find_d_rotation
  #   key = Key.new('01234')
  #
  #   assert_equal 34, key.d_rotation
  # end
end
