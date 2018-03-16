# # frozen_string_literal: true
require_relative 'command'
module Commands
  class Move < Command
    def execute(robot, table_top, robot_location)
      return nil if robot_location.nil?
      
      robot_direction = robot_location.direction
      robot_coordinate = robot_location.coordinate
      (x_offset, y_offset) = Direction.move(robot_direction)
      new_coordinate = Coordinate.new(robot_coordinate.x + x_offset, robot_coordinate.y + y_offset)
      table_top.within_boundary?(new_coordinate) ? Location.new(new_coordinate, robot_direction) : robot_location
    end
  end
end
