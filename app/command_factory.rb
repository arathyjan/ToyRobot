# frozen_string_literal: true

class CommandFactory
  PLACE_COMMAND_REGEX = /^PLACE\ [0-9],[0-9],(EAST|WEST|NORTH|SOUTH)$/

  class << self
    def create(command_string)
      if PLACE_COMMAND_REGEX.match? command_string
        return create_place_command(command_string)
      end

      case command_string.to_sym
      when :MOVE
        return Commands::Move.new
      when :RIGHT
        return Commands::Right.new
      end

      raise InvalidCommandError, "invalid command #{command_string}"
    end

    private

    def create_place_command(command_string)
      (x, y, direction) = command_string.split(' ')[1].split(',')
      Commands::Place.new(x.to_i, y.to_i, direction.to_sym)
    end
  end
end
