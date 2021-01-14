require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryption'

class EncryptionTest < Minitest::Test
  def test_it_exists_and_has_attributes
    encryption = Encryption.new

    assert_instance_of Encryption, encryption
  end

  def test_it_can_give_letter_1_rotation
    encryption = Encryption.new

    assert_equal 59, encryption.letter_1_rotation
  end

  def test_it_can_give_letter_2_rotation
    encryption = Encryption.new

    assert_equal 1, encryption.letter_2_rotation
  end

  def test_it_can_give_letter_3_rotation
    encryption = Encryption.new

    assert_equal 13, encryption.letter_3_rotation
  end

  def test_it_can_give_letter_4_rotation
    encryption = Encryption.new

    assert_equal 23, encryption.letter_4_rotation
  end
end
