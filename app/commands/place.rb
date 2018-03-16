# frozen_string_literal: true
module Commands
  class Place < Command
    def initialize(x, y, direction)
      @location = Location.new(Coordinate.new(x, y), direction)
    end

    def execute(table_top, location)
      table_top.within_boundary?(@location.coordinate) ? @location : location
    end
  end
end
