require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'

class KeyTest < Minitest::Test
  def test_it_exists_and_has_attributes
    key = Key.new
    key2 = Key.new('01234')

    assert_instance_of Key, key
    assert_equal 5, key.key.length
    assert_equal '01234', key2.key
  end

  def test_it_can_give_key_split
    key = Key.new('01234')

    assert_equal [["6", "1"], ["1", "9"], ["9", "8"], ["8", "9"]], key.key_split
  end

  def test_it_can_give_key_array
    key = Key.new('01234')

    assert_equal ["01", "12", "23", "34"], key.key_array
  end

  def test_it_can_give_index_hash
    key = Key.new('01234')
    key2 = Key.new

    assert_equal ({1 => '01', 2 => '12', 3 => '23', 4 => '34'}), key.index_hash
    assert_equal [1, 2, 3, 4], key2.index_hash.keys
  end

  def test_it_can_give_rotation_for_a_number
    key = Key.new('01234')

    assert_equal 1, key.rotation(1)
    assert_equal 12, key.rotation(2)
    assert_equal 23, key.rotation(3)
    assert_equal 34, key.rotation(4)
  end
end
