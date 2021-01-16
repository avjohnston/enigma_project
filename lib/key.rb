class Key
  attr_reader :key

  def initialize(key = rand(1...99_999).to_s.rjust(5, "0"))
    @key = key
  end

  def key_array
    array = []
    @key.split('').each_cons(2) do |num|
      array << num
    end
    array.map do |array|
      array.join('')
    end
  end

  def index_hash
    index_hash = Hash.new
    count = 0
    key_array.map do |num|
      count += 1
      index_hash[count] = num
    end
    index_hash
  end

  def rotation(number)
    index_hash.find do |index, num|
      index == number
    end.last.to_i
  end

  # def a_rotation
  #   @key[0..1].to_i
  # end
  #
  # def b_rotation
  #   @key[1..2].to_i
  # end
  #
  # def c_rotation
  #   @key[2..3].to_i
  # end
  #
  # def d_rotation
  #   @key[3..4].to_i
  # end
end
