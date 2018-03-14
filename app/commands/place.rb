# frozen_string_literal: true
module Commands
  class Place < Command
    def initialize(x, y, direction)
      @location = Location.new(Coordinate.new(x, y), direction)
    end

    def execute(robot, table_top, robot_location)
      table_top.within_boundary?(@location.coordinate) ? @location : robot_location
    end
  end
end
