require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'
require './lib/offset'
require './lib/enigma'
class EnigmaTest < Minitest::Test
  def test_it_exists_and_has_attributes
    enigma = Enigma.new('hello world', '02715', '040895')

    assert_instance_of Enigma, enigma
  end
end
