require_relative 'offset'
require_relative 'key'

class Encryption
  def initialize(key = '50118', offset = '122095')
    @key = Key.new(key)
    @offset = Offset.new(offset)
  end

  def letter_1_rotation
    @offset.a_rotation + @key.a_rotation
  end

  def letter_2_rotation
    @offset.b_rotation + @key.b_rotation
  end

  def letter_3_rotation
    @offset.c_rotation + @key.c_rotation
  end

  def letter_4_rotation
    @offset.d_rotation + @key.d_rotation
  end

end
