require 'simplecov'
SimpleCov.start

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

    assert_equal expected, enigma.encrypt('hello world', '02715', '040895')

    encryption = enigma.encrypt('hello world', '02715')
    assert_instance_of Hash, encryption
    assert_equal 11, encryption[:encryption].length
    assert_equal 5, encryption[:key].length
    assert_equal 6, encryption[:date].length

    encryption2 = enigma.encrypt('hello world')
    assert_instance_of Hash, encryption2
    assert_equal 11, encryption2[:encryption].length
    assert_equal 5, encryption2[:key].length
    assert_equal 6, encryption2[:date].length
  end

  def test_it_can_decrypt
    enigma = Enigma.new
    expected = {
                  decryption: 'hello world',
                  key: '02715',
                  date: '040895'
                }

    assert_equal expected, enigma.decrypt('keder ohulw', '02715', '040895')

    decryption = enigma.decrypt('keder ohulw', '02715')
    assert_instance_of Hash, decryption
    assert_equal 11, decryption[:decryption].length
    assert_equal 5, decryption[:key].length
    assert_equal 6, decryption[:date].length

    encryption = enigma.encrypt('hello world', '02715', '040895')

    assert_equal expected, enigma.decrypt(encryption[:encryption], '02715', '040895')
  end
end
