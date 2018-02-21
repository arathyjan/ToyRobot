module ToyRobot
  class Simulator
    INPUT_FILE_NAME = './input.txt'
    
    def start
      CommandFileReader.read!(INPUT_FILE_NAME)
      .each do |command_string|
        command = CommandFactory.parse(command_string)
      end
    end
  end
end
