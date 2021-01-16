require 'time'

class Offset
  attr_reader :date

  def initialize(date = (Time.now.strftime('%d%m%y')))
    @date = date
  end

  def square_date
    (@date.to_i ** 2).to_s[-4..-1].split('')
  end

  def index_hash
    index_hash = Hash.new
    count = 0
    square_date.map do |num|
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
