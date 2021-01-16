require_relative 'offset'
require_relative 'key'

class Rotation

  def initialize
    @chars = ('a'..'z').to_a + [' ']
    @key = Key.new
    @date = Offset.new
  end

  def letter_shift(letter, rotation, type, key = @key, date = @date)
    unless !@chars.include?(letter)
      old_letter = @chars.rotate(@chars.index(letter))
      new_letter = old_letter.rotate(date.rotation(rotation) + key.rotation(rotation)).first if type == :encryption
      new_letter = old_letter.rotate(- (date.rotation(rotation) + key.rotation(rotation))).first if type == :decryption
      new_letter
    else
      new_letter = letter
    end
  end

  def apply_shift(message, type, key = @key, date = @date)
    letters = message.split("")
    letter_number = 0
    new_text = ""
    letters.each do |letter|
      letter_number += 1; letter_number = 1 if letter_number > 4
      new_text += letter_shift(letter, 1, type, key, date) if letter_number == 1
      new_text += letter_shift(letter, 2, type, key, date) if letter_number == 2
      new_text += letter_shift(letter, 3, type, key, date) if letter_number == 3
      new_text += letter_shift(letter, 4, type, key, date) if letter_number == 4
    end
    new_text
  end

  # def letter_2_shift(letter, type, key = @key, date = @date)
  #   unless !@chars.include?(letter)
  #     old_letter = @chars.rotate(@chars.index(letter))
  #     new_letter = old_letter.rotate((date.b_rotation + key.b_rotation) % 27).first if type == :encryption
  #     new_letter = old_letter.rotate(- ((date.b_rotation + key.b_rotation) % 27)).first if type == :decryption
  #     new_letter
  #   else
  #     new_letter = letter
  #   end
  # end
  #
  # def letter_3_shift(letter, type, key = @key, date = @date)
  #   unless !@chars.include?(letter)
  #     old_letter = @chars.rotate(@chars.index(letter))
  #     new_letter = old_letter.rotate((date.c_rotation + key.c_rotation) % 27).first if type == :encryption
  #     new_letter = old_letter.rotate(- ((date.c_rotation + key.c_rotation) % 27)).first if type == :decryption
  #     new_letter
  #   else
  #     new_letter = letter
  #   end
  # end
  #
  # def letter_4_shift(letter, type, key = @key, date = @date)
  #   unless !@chars.include?(letter)
  #     old_letter = @chars.rotate(@chars.index(letter))
  #     new_letter = old_letter.rotate((date.d_rotation + key.d_rotation) % 27).first if type == :encryption
  #     new_letter = old_letter.rotate(- ((date.d_rotation + key.d_rotation) % 27)).first if type == :decryption
  #     new_letter
  #   else
  #     new_letter = letter
  #   end
  # end

end
