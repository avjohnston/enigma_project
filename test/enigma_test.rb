require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'
require './lib/offset'
require './lib/rotation'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists_and_has_attributes
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt
    enigma = Enigma.new
    expected = {
                  encryption: 'keder ohulw',
                  key: '02715',
                  date: '040895'
                }
  require "pry"; binding.pry
    assert_equal expected, enigma.encrypt('hello world', '02175', '040895')
  end
end
