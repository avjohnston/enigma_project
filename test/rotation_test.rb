require 'simplecov'
SimpleCov.start

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

    assert_equal 'f', shift.letter_1_shift('a', :encryption, Key.new('50118'), Offset.new('122095'))
    assert_equal 'a', shift.letter_1_shift('f', :decryption, Key.new('50118'), Offset.new('122095'))
    assert_equal '-', shift.letter_1_shift('-', :encryption)
  end

  def test_it_can_letter_2_shift
    shift = Rotation.new

    assert_equal 'b', shift.letter_2_shift('a', :encryption, Key.new('50118'), Offset.new('122095'))
    assert_equal 'a', shift.letter_2_shift('b', :decryption, Key.new('50118'), Offset.new('122095'))
    assert_equal '!', shift.letter_2_shift('!', :encryption)
  end

  def test_it_can_letter_3_shift
    shift = Rotation.new

    assert_equal 'n', shift.letter_3_shift('a', :encryption, Key.new('50118'), Offset.new('122095'))
    assert_equal 'a', shift.letter_3_shift('n', :decryption, Key.new('50118'), Offset.new('122095'))
    assert_equal '0', shift.letter_3_shift('0', :encryption)
  end

  def test_it_can_letter_4_shift
    shift = Rotation.new

    assert_equal 'x', shift.letter_4_shift('a', :encryption, Key.new('50118'), Offset.new('122095'))
    assert_equal 'a', shift.letter_4_shift('x', :decryption, Key.new('50118'), Offset.new('122095'))
    assert_equal '/', shift.letter_4_shift('/', :encryption)
  end

  def test_it_can_apply_shift
    shift = Rotation.new
    encryption = shift.apply_shift('hello world', :encryption)

    assert_equal 'keder ohulw', shift.apply_shift('hello world', :encryption, Key.new('02715'), Offset.new('040895'))
    assert_equal 'hello world', shift.apply_shift('keder ohulw', :decryption, Key.new('02715'), Offset.new('040895'))
  end
end
