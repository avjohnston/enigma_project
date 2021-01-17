class Key
  attr_reader :key

  def initialize(key = rand.to_s[2..6])
    @key = key
  end

  def key_split
    array = []
    @key.split('').each_cons(2) do |num|
      array << num
    end
    array
  end

  def key_array
    key_split.map do |array|
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
end
