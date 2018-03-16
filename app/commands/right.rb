# # frozen_string_literal: true
require_relative 'command'
module Commands
  class Right < Command
    def execute(robot, table_top, robot_location)
      return nil if robot_location.nil?

      Location.new(robot_location.coordinate, Direction.right(robot_location.direction))
    end
  end
end
