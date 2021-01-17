require_relative 'offset'
require_relative 'key'

class Rotation
  attr_reader :chars
  def initialize
    @chars = ('a'..'z').to_a + [' ']
    @key = Key.new
    @date = Offset.new
  end

  def shift_value(rotation, type, key = @key, date = @date)
    if type == :encryption
      (date.rotation(rotation) + key.rotation(rotation))
    else
    ((date.rotation(rotation) + key.rotation(rotation)) * -1)
    end
  end

  def letter_shift(letter, rotation, type, key = @key, date = @date)
    if @chars.include?(letter)
      old_letter = @chars.rotate(@chars.index(letter))
      new_letter = old_letter.rotate(shift_value(rotation, type, key, date)).first
      new_letter
    else
      new_letter = letter
    end
  end

  def apply_shift(message, type, key = @key, date = @date)
    letters = message.split('')
    letter_number = 0
    new_text = ''
    letters.each do |letter|
      letter_number += 1; letter_number = 1 if letter_number > 4
      new_text += letter_shift(letter, 1, type, key, date) if letter_number == 1
      new_text += letter_shift(letter, 2, type, key, date) if letter_number == 2
      new_text += letter_shift(letter, 3, type, key, date) if letter_number == 3
      new_text += letter_shift(letter, 4, type, key, date) if letter_number == 4
    end
    new_text
  end
end
