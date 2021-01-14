require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'

class OffsetTest < Minitest::Test
  def test_it_exists_and_has_attributes
    time = Time.now.strftime('%Y-%m-%d').to_s[2..9].split('-').reverse.join('')
    date = Offset.new
    date2 = Offset.new('021420')
    assert_instance_of Offset, date
    assert_equal '021420', date2.date
    assert_equal time, date.date
  end

  def test_it_can_square_date
    offset = Offset.new('021420')

    assert_equal '458816400', offset.square_date
  end

  def test_it_can_get_offset
    offset = Offset.new('021420')

    assert_equal '6400', offset.get_offset
  end

  def test_a_offset
    offset = Offset.new('021420')

    assert_equal 6, offset.a_offset
  end

  def test_b_offset
    offset = Offset.new('021420')

    assert_equal 4, offset.b_offset
  end

  def test_c_offset
    offset = Offset.new('021420')

    assert_equal 0, offset.c_offset
  end

  def test_d_offset
    offset = Offset.new('021420')

    assert_equal 0, offset.d_offset
  end
end
