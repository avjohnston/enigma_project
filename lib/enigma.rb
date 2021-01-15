class Enigma
  def initialize
    @rotation = Rotation.new
  end

  def encrypt(message, key = Key.new.key, date = Offset.new.date)
    encrypt = {
                encryption: @rotation.apply_shift(message, :encryption, Key.new(key), Offset.new(date)),
                key: key,
                date: date
              }
    encrypt
  end

  def decrypt(message, key, date = Offset.new.date)
    decrypt = {
                decryption: @rotation.apply_shift(message, :decryption, Key.new(key), Offset.new(date)),
                key: key,
                date: date
              }
    decrypt
  end
end
