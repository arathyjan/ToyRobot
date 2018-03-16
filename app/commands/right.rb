# # frozen_string_literal: true
require_relative 'command'
module Commands
  class Right < Command
    def execute(table_top, location)
      return nil if location.nil?

      Location.new(location.coordinate, Direction.right(location.direction))
    end
  end
end
