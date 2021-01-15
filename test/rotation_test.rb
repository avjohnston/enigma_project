require 'minitest/autorun'
require 'minitest/pride'
require './lib/rotation'

class RotationTest < Minitest::Test
  def test_it_exists_and_has_attributes
    shift = Rotation.new

    assert_instance_of Rotation, shift
  end

  def test_it_can_letter_1_shift
    shift = Rotation.new
    forward_shift = shift.letter_1_shift('a', :encryption)

    assert_equal 'a', shift.letter_1_shift(shift.letter_1_shift('a', :encryption), :decryption)
  end

  def test_it_can_letter_2_shift
    shift = Rotation.new
    forward_shift = shift.letter_2_shift('a', :encryption)

    assert_equal 'a', shift.letter_2_shift(shift.letter_2_shift('a', :encryption), :decryption)
  end

  def test_it_can_letter_3_shift
    shift = Rotation.new
    forward_shift = shift.letter_3_shift('a', :encryption)

    assert_equal 'a', shift.letter_3_shift(shift.letter_3_shift('a', :encryption), :decryption)
  end

  def test_it_can_letter_4_shift
    shift = Rotation.new
    forward_shift = shift.letter_4_shift('a', :encryption)

    assert_equal 'a', shift.letter_4_shift(shift.letter_4_shift('a', :encryption), :decryption)
  end

  def test_it_can_apply_shift
    shift = Rotation.new
    encryption = shift.apply_shift('hello world', :encryption)

    assert_equal 'hello world', shift.apply_shift(shift.apply_shift('hello world', :encryption), :decryption)
  end
end
