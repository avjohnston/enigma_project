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

  def test_it_can_find_shift_value
    shift = Rotation.new

    assert_equal 3, shift.shift_value(1, :encryption, Key.new('02715'), Offset.new('040895'))
    assert_equal 27, shift.shift_value(2, :encryption, Key.new('02715'), Offset.new('040895'))
    assert_equal 73, shift.shift_value(3, :encryption, Key.new('02715'), Offset.new('040895'))
    assert_equal 20, shift.shift_value(4, :encryption, Key.new('02715'), Offset.new('040895'))

    assert_equal -3, shift.shift_value(1, :decryption, Key.new('02715'), Offset.new('040895'))
    assert_equal -27, shift.shift_value(2, :decryption, Key.new('02715'), Offset.new('040895'))
    assert_equal -73, shift.shift_value(3, :decryption, Key.new('02715'), Offset.new('040895'))
    assert_equal -20, shift.shift_value(4, :decryption, Key.new('02715'), Offset.new('040895'))

    assert_instance_of Integer, shift.shift_value(1, :encryption)
    assert_instance_of Integer, shift.shift_value(1, :encryption, Key.new('02715'))
    assert_instance_of Integer, shift.shift_value(1, :encryption, Offset.new('040895'))

    assert_instance_of Integer, shift.shift_value(1, :decryption)
    assert_instance_of Integer, shift.shift_value(1, :decryption, Key.new('02715'))
    assert_instance_of Integer, shift.shift_value(1, :decryption, Offset.new('040895'))
  end

  def test_it_can_letter_shift
    shift = Rotation.new

    assert_equal 'k', shift.letter_shift('h', 1, :encryption, Key.new('02715'), Offset.new('040895'))
    assert_equal 'e', shift.letter_shift('e', 2, :encryption, Key.new('02715'), Offset.new('040895'))
    assert_equal 'd', shift.letter_shift('l', 3, :encryption, Key.new('02715'), Offset.new('040895'))
    assert_equal 'e', shift.letter_shift('l', 4, :encryption, Key.new('02715'), Offset.new('040895'))

    assert_equal 'h', shift.letter_shift('k', 1, :decryption, Key.new('02715'), Offset.new('040895'))
    assert_equal 'e', shift.letter_shift('e', 2, :decryption, Key.new('02715'), Offset.new('040895'))
    assert_equal 'l', shift.letter_shift('d', 3, :decryption, Key.new('02715'), Offset.new('040895'))
    assert_equal 'l', shift.letter_shift('e', 4, :decryption, Key.new('02715'), Offset.new('040895'))

    assert_equal '!', shift.letter_shift('!', 4, :decryption, Key.new('02715'), Offset.new('040895'))
    assert_equal '0', shift.letter_shift('0', 3, :decryption, Key.new('02715'), Offset.new('040895'))
    assert_equal '/', shift.letter_shift('/', 2, :decryption, Key.new('02715'), Offset.new('040895'))
    assert_equal '?', shift.letter_shift('?', 1, :decryption, Key.new('02715'), Offset.new('040895'))

    assert shift.chars.include?(shift.letter_shift('a', 4, :encryption))
    assert shift.chars.include?(shift.letter_shift('a', 4, :encryption, Key.new('02715')))
    assert shift.chars.include?(shift.letter_shift('a', 4, :encryption, Offset.new('040895')))

    assert shift.chars.include?(shift.letter_shift('a', 4, :decryption))
    assert shift.chars.include?(shift.letter_shift('a', 4, :decryption, Key.new('02715')))
    assert shift.chars.include?(shift.letter_shift('a', 4, :decryption, Offset.new('040895')))
  end

  def test_it_can_apply_shift
    shift = Rotation.new
    encryption = shift.apply_shift('HeLlo World', :encryption)

    assert_equal 'keder ohulw', shift.apply_shift('hello world', :encryption, Key.new('02715'), Offset.new('040895'))
    assert_equal 'hello world', shift.apply_shift('keder ohulw', :decryption, Key.new('02715'), Offset.new('040895'))

    assert_equal 'hello world', shift.apply_shift(shift.apply_shift('hello world', :encryption), :decryption)
    assert_equal 'hello world', shift.apply_shift(shift.apply_shift('hello world', :encryption, Key.new('02715')), :decryption, Key.new('02715'))
    assert_equal 'hello world', shift.apply_shift(shift.apply_shift('hello world', :encryption, Offset.new('040895')), :decryption, Offset.new('040895'))
  end
end
