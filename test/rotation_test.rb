require 'minitest/autorun'
require 'minitest/pride'
require './lib/rotation'

class RotationTest < Minitest::Test
  def test_it_exists_and_has_attributes
    rotation = Rotation.new(:encrypt)
    require "pry"; binding.pry
    assert_instance_of Rotation, rotation
    assert_equal :encrypt, rotation.type
  end
end

  # def test_it_can_give_letter_1_rotation
  #   rotation = Rotation.new
  #
  #   assert_equal 59, rotation.letter_1_rotation
  # end
  #
  # def test_it_can_give_letter_2_rotation
  #   rotation = Rotation.new
  #
  #   assert_equal 1, rotation.letter_2_rotation
  # end
  #
  # def test_it_can_give_letter_3_rotation
  #   rotation = Rotation.new
  #
  #   assert_equal 13, rotation.letter_3_rotation
  # end
  #
  # def test_it_can_give_letter_4_rotation
  #   rotation = Rotation.new
  #
  #   assert_equal 23, rotation.letter_4_rotation
  # end
