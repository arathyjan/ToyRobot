# frozen_string_literal: true
class Simulator
  INPUT_FILE_NAME = './input.txt'
  
  def initialize
    @robot = Robot.new
    @table_top = TableTop.new(5, 5)
    @robot_location = nil
  end

  def start
    CommandFileReader
      .read!(INPUT_FILE_NAME)
      .each do |command_string|
          command = CommandFactory.create(command_string)
          @robot_location = command.execute(@robot, @table_top, @robot_location)
        rescue InvalidCommandError => e
          p e
          next
        end
  end
end
