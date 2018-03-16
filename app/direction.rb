# frozen_string_literal: true

class Direction
  ALLOWED_DIRECTIONS = {
    :NORTH => {
      :MOVE =>  [0, 1],
      :RIGHT => :EAST,
      :LEFT => :WEST
    },
    :EAST => {
      :MOVE =>  [1, 0],
      :RIGHT => :SOUTH,
      :LEFT => :NORTH
    },
    :SOUTH => {
      :MOVE =>  [0, -1],
      :RIGHT => :WEST,
      :LEFT => :EAST
    },
    :WEST => {
      :MOVE =>  [-1, 0],
      :RIGHT => :NORTH,
      :LEFT => :SOUTH
    }
  }

  class << self
    def move(direction)
      ALLOWED_DIRECTIONS.fetch(direction).fetch(:MOVE)
    end

    def right(direction)
      ALLOWED_DIRECTIONS.fetch(direction).fetch(:RIGHT)
    end

    def left(direction)
      ALLOWED_DIRECTIONS.fetch(direction).fetch(:LEFT)
    end
  end
end
