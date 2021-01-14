require 'date'

class Offset
  attr_reader :date

  def initialize(date = (Time.now.strftime('%Y-%m-%d').to_s[2..9].split('-').reverse.join('')))
    @date = date
  end

  def square_date
    (@date.to_i ** 2).to_s
  end

  def get_offset
    square_date[-4..-1]
  end

  def a_offset
    get_offset[0].to_i
  end

  def b_offset
    get_offset[1].to_i
  end

  def c_offset
    get_offset[2].to_i
  end

  def d_offset
    get_offset[3].to_i
  end

end
