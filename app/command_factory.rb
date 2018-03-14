# frozen_string_literal: true

class CommandFactory
  PLACE_COMMAND_REGEX = /^PLACE\ [0-9],[0-9],(EAST|WEST|NORTH|SOUTH)$/

  class << self
    def create(command_string)
      if PLACE_COMMAND_REGEX.match? command_string
        (x, y, direction) = command_string.split(' ')[1].split(',')
        return Commands::Place.new(x.to_i, y.to_i, direction.to_sym)
      end
      raise InvalidCommandError, "invalid command #{command_string}"
    end
  end
end
