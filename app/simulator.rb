# frozen_string_literal: true
module ToyRobot
  class Simulator
    INPUT_FILE_NAME = './input.txt'
    
    def start
      CommandFileReader
        .read!(INPUT_FILE_NAME)
        .each do |command_string|
            command = CommandFactory.parse(command_string)
          rescue InvalidCommandError => e
            p e
            next
          end
    end
  end
end
