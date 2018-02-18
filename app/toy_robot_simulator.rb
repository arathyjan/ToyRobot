module ToyRobot
  class ToyRobotSimulator
    INPUT_FILE_NAME = './input.txt'

    def start
      CommandFileReader.read!(INPUT_FILE_NAME)
    end
  end
end
