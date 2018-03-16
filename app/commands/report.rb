# # frozen_string_literal: true
require_relative 'command'
module Commands
  class Report < Command
    def execute(robot, table_top, robot_location)
      robot_location.tap do |location|
        OutputProcessor.print(location) unless location.nil?
      end
    end
  end
end
