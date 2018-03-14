# frozen_string_literal: true

class Location
  attr_accessor :coordinate
  attr_accessor :direction

  def initialize(coordinate, direction)
    @coordinate = coordinate
    @direction = direction
  end
end
