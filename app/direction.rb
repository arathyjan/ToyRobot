# frozen_string_literal: true

class Direction
  ALLOWED_DIRECTIONS = [:NORTH, :EAST, :SOUTH, :WEST]

  class << self
    def move(direction)
      case direction
      when :NORTH
        [0, 1]
      when :SOUTH
        [0, -1]
      when :EAST
        [1, 0]
      when :WEST
        [-1, 0]
      end
    end
  end
end
