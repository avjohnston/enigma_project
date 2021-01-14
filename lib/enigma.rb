class Enigma
  def initialize(message, key, offset)
    @message = message
    @key = key
    @offset = offset
    @encrypt = {}
    @decrypt = {}
  end

  def encrypt(message, key, offset)
    encrypt[message] = helper_method(message)
    encrypt[key] = key
    encrypt[offset] = offset
  end

  def decrypt(message, key, offset)
    decrypt[message] = helper_method_2(message)
    decrypt[key] = key
    decrypt[offset] = offset
  end
end
