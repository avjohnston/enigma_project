require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'

class OffsetTest < Minitest::Test
  def test_it_exists_and_has_attributes
    time = Time.now.strftime('%d%m%y')
    date = Offset.new
    date2 = Offset.new('021420')
    assert_instance_of Offset, date
    assert_equal '021420', date2.date
    assert_equal time, date.date
  end

  def test_it_can_square_date
    date = Offset.new('021420')

    assert_equal ["6", "4", "0", "0"], date.square_date
  end

  def test_it_can_give_index_hash
    date = Offset.new('021420')

    assert_equal ({1 => '6', 2 => '4', 3 => '0', 4 => '0'}), date.index_hash
  end

  def test_it_can_rotate_given_a_number
    date = Offset.new('021420')

    assert_equal 6, date.rotation(1)
    assert_equal 4, date.rotation(2)
    assert_equal 0, date.rotation(3)
    assert_equal 0, date.rotation(4)
  end
end
