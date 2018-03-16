# # frozen_string_literal: true
require_relative 'command'
module Commands
  class Left < Command
    def execute(robot, table_top, robot_location)
      return nil if robot_location.nil?

      Location.new(robot_location.coordinate, Direction.left(robot_location.direction))
    end
  end
end
