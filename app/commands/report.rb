# # frozen_string_literal: true
require_relative 'command'
module Commands
  class Report < Command
    def execute(table_top, location)
      location.tap do |location|
        OutputProcessor.print(location) unless location.nil?
      end
    end
  end
end
