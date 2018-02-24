# frozen_string_literal: true

class CommandFileReader
  class << self
    def read!(input_file)
      inputs = File.readlines(input_file)
      inputs.map(&:strip)
    end
  end
end
