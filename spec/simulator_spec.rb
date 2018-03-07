require './spec/spec_helper'
require 'pry'
RSpec.describe Simulator do
  describe '.start' do
    subject(:start) { described_class.new.start}

    context 'parse input file' do
      let(:command_string_array) { %w{PLACE\ 1,2,EAST SOMETHING PLACE\ 1,2,WEST} }
      before do
        allow(CommandFileReader).to receive(:read!).with(Simulator::INPUT_FILE_NAME).and_return(command_string_array)
      end

      it 'create array of commands' do
        expect(CommandFileReader).to receive(:read!).with(Simulator::INPUT_FILE_NAME).and_return(command_string_array)
        start
      end

      it 'creates list of Command from the list of command string ignoring exceptions' do
        allow(CommandFactory).to receive(:create).and_return(Commands::Place.new(1,2,:EAST))

        expect(CommandFactory).to receive(:create).exactly(3).times
        start
      end

      context 'when command factory returns with list of commands' do
        let(:command) { Commands::Place.new(1,2,:EAST) }

        it 'execute the command with instance of robot and table top' do
          allow(CommandFactory).to receive(:create).with('PLACE 1,2,EAST').and_return(command)
          allow(CommandFactory).to receive(:create).with('SOMETHING').and_raise(InvalidCommandError)
          allow(CommandFactory).to receive(:create).with('PLACE 1,2,WEST').and_return(command)

          expect(command).to receive(:execute).twice
          start
        end
      end
    end
  end
end
