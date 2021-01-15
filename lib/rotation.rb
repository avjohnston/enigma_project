require_relative 'offset'
require_relative 'key'

class Rotation
  attr_reader :type,
              :chars

  def initialize(type)
    @type = type
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
    rotation = Rotation.new(type)
    letters = text.split("")
    position = 0
    new_text = ""
    letters.each do |letter|
      position += 1; position = 1 if position > 4
      new_text += letter_1_shift(letter, type) if position == 1
      new_text += letter_2_shift(letter, type) if position == 2
      new_text += letter_3_shift(letter, type) if position == 3
      new_text += letter_4_shift(letter, type) if position == 4
    end
    new_text
  end
end
