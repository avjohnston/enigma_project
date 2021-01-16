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
    offset = Offset.new('021420')
    
    assert_equal '6400', offset.square_date
  end

  def test_a_rotation
    offset = Offset.new('021420')

    assert_equal 6, offset.a_rotation
  end

  def test_b_rotation
    offset = Offset.new('021420')

    assert_equal 4, offset.b_rotation
  end

  def test_c_rotation
    offset = Offset.new('021420')

    assert_equal 0, offset.c_rotation
  end

  def test_d_rotation
    offset = Offset.new('021420')

    assert_equal 0, offset.d_rotation
  end
end
