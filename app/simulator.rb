# frozen_string_literal: true
class Simulator
  
  def initialize
    @table_top = TableTop.new(5, 5)
    @robot_location = nil
  end

  def start(input_file)
    CommandFileReader
      .read!(input_file)
      .each do |command_string|
          command = CommandFactory.create(command_string)
          @robot_location = command.execute(@table_top, @robot_location)
        rescue InvalidCommandError => e
          p e
          next
        end
  end
end
