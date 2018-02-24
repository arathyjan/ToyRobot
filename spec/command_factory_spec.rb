require './spec/spec_helper'

RSpec.describe ToyRobot::CommandFactory do
  describe '.parse' do
    
    context 'when parsing place command' do
      it 'successfully parse PLACE 1,2,EAST command string to Place Command' do
        expect(described_class.parse 'PLACE 1,2,EAST').to be_an_instance_of ToyRobot::Commands::Place
      end

      context 'doesnt parse any other command string which doesnt follow the corresponding regex to Place command' do
        ['PLACE', 'PLACE12EAST', 'SOMETHING 1,2,EAST', 'PLACE 1 2 EAST', 'PLACE 23,45,WEST']
          .each do |invalid_place_command|
            it 'doesnt parse #{invalid_place_command} command string to Place Command' do
              expect { described_class.parse invalid_place_command }.to raise_error ToyRobot::InvalidCommandError
            end
        end
      end
    end

    it 'raise exception while trying to parse invalid command string' do
      expect { described_class.parse 'INVALID_COMMAND' }.to raise_error ToyRobot::InvalidCommandError
    end
  end
end
