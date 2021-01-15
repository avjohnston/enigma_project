class Enigma
  def initialize
    @rotation = Rotation.new
    @encrypt = {}
    @decrypt = {}
    @key = Key.new
    @date = Offset.new
  end

  def encrypt(message, key, date)
    encrypt = {
                encryption: @rotation.apply_shift(message, :encryption),
                key: key,
                date: date
              }

    encrypt
  end

  # def decrypt(message, key, date)
  #   key = Key.new(key)
  #   offset = Offset.new(offset)
  #   encrypt = {
  #               decryption: @rotation.apply_shift(message, :decryption),
  #               key: key,
  #               date: offset
  #             }
  #
  #   encrypt
  # end
end
