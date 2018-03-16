# frozen_string_literal: true

class OutputProcessor
  class << self
    def print(location)
      puts "#{location.coordinate.x},#{location.coordinate.y},#{location.direction.to_s}"
    end
  end
end
