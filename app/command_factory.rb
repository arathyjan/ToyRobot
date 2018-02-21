module ToyRobot
  class CommandFactory
    PLACE_COMMAND_REGEX = /^PLACE\ [0-9],[0-9],(EAST|WEST|NORTH|SOUTH)$/
    
    class << self
      def parse(command_string)
        return Commands::Place.new if PLACE_COMMAND_REGEX.match? command_string
      end
    end
  end
end