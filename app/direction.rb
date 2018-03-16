# frozen_string_literal: true

class Direction
  ALLOWED_DIRECTIONS = {
    :NORTH => {
      :MOVE =>  [0, 1],
      :RIGHT => :EAST
    },
    :EAST => {
      :MOVE =>  [1, 0],
      :RIGHT => :SOUTH
    },
    :SOUTH => {
      :MOVE =>  [0, -1],
      :RIGHT => :WEST
    },
    :WEST => {
      :MOVE =>  [-1, 0],
      :RIGHT => :NORTH
    }
  }

  class << self
    def move(direction)
      ALLOWED_DIRECTIONS.fetch(direction).fetch(:MOVE)
    end

    def right(direction)
      ALLOWED_DIRECTIONS.fetch(direction).fetch(:RIGHT)
    end
  end
end
