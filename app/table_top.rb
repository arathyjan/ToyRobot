# frozen_string_literal: true
class TableTop
  def initialize(size_x, size_y)
    @size_x = size_x
    @size_y = size_y
  end

  def within_boundary?(coordinate)
    return coordinate.x.between?(0, @size_x - 1) && coordinate.y.between?(0, @size_y - 1)
  end
end
