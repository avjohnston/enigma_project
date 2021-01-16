require 'time'

class Offset
  attr_reader :date

  def initialize(date = (Time.now.strftime('%d%m%y')))
    @date = date
  end

  def square_date
    (@date.to_i ** 2).to_s
  end

  def get_offset
    square_date[-4..-1]
  end

  def a_rotation
    get_offset[0].to_i
  end

  def b_rotation
    get_offset[1].to_i
  end

  def c_rotation
    get_offset[2].to_i
  end

  def d_rotation
    get_offset[3].to_i
  end

end
