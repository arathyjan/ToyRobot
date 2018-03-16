# # frozen_string_literal: true
require_relative 'command'
module Commands
  class Left < Command
    def execute(table_top, location)
      return nil if location.nil?

      Location.new(location.coordinate, Direction.left(location.direction))
    end
  end
end
