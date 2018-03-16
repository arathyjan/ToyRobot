# # frozen_string_literal: true
require_relative 'command'
module Commands
  class Move < Command
    def execute(table_top, location)
      return nil if location.nil?

      new_location = new_location_from(location)
      table_top.within_boundary?(new_location.coordinate) ? new_location : location
    end

    private

    def new_location_from(location)
      (x_offset, y_offset) = Direction.move(location.direction)
      new_coordinate = Coordinate.new(
        location.coordinate.x + x_offset,
        location.coordinate.y + y_offset
        )
      Location.new(new_coordinate, location.direction)
    end
  end
end
