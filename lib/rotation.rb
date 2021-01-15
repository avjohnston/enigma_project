require_relative 'offset'
require_relative 'key'

class Rotation

  def initialize
    @chars = ('a'..'z').to_a + [' ']
    @key = Key.new
    @offset = Offset.new
  end

  def letter_1_shift(letter, type)
    unless !@chars.include?(letter)
      new_letter = @chars.rotate((@chars.index(letter) + @offset.a_rotation + @key.a_rotation) % 27).first if type == :encryption
      new_letter = @chars.rotate(@chars.index(letter) - ((@offset.a_rotation + @key.a_rotation) % 27)).first if type == :decryption
      new_letter[0]
    else
      new_letter = letter
    end
  end

  def letter_2_shift(letter, type)
    unless !@chars.include?(letter)
      new_letter = @chars.rotate((@chars.index(letter) + @offset.b_rotation + @key.b_rotation) % 27).first if type == :encryption
      new_letter = @chars.rotate(@chars.index(letter) - ((@offset.b_rotation + @key.b_rotation) % 27)).first if type == :decryption
      new_letter[0]
    else
      new_letter = letter
    end
  end

  def letter_3_shift(letter, type)
    unless !@chars.include?(letter)
      new_letter = @chars.rotate((@chars.index(letter) + @offset.c_rotation + @key.c_rotation) % 27).first if type == :encryption
      new_letter = @chars.rotate(@chars.index(letter) - ((@offset.c_rotation + @key.c_rotation) % 27)).first if type == :decryption
      new_letter[0]
    else
      new_letter = letter
    end
  end

  def letter_4_shift(letter, type)
    unless !@chars.include?(letter)
      new_letter = @chars.rotate((@chars.index(letter) + @offset.d_rotation + @key.d_rotation) % 27).first if type == :encryption
      new_letter = @chars.rotate(@chars.index(letter) - ((@offset.d_rotation + @key.d_rotation) % 27)).first if type == :decryption
      new_letter[0]
    else
      new_letter = letter
    end
  end

  def apply_shift(text, type)
    rotation = Rotation.new
    letters = text.split("")
    letter_number = 0
    new_text = ""
    letters.each do |letter|
      letter_number += 1; letter_number = 1 if letter_number > 4
      new_text += letter_1_shift(letter, type) if letter_number == 1
      new_text += letter_2_shift(letter, type) if letter_number == 2
      new_text += letter_3_shift(letter, type) if letter_number == 3
      new_text += letter_4_shift(letter, type) if letter_number == 4
    end
    new_text
  end
end
