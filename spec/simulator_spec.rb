require './spec/spec_helper'

RSpec.describe Simulator do
  describe '.start' do
    subject(:start) { described_class.new.start}

    context ' when failed to read input file' do
      it 'throw the error back' do
        allow(CommandFileReader).to receive(:read!).with('invalid_file').and_raise(StandardError)

        expect { start }.to raise_error { StandardError }
      end
    end

    context 'parse input file' do
      let(:command_string_array) { %w{PLACE\ 1,2,EAST SOMETHING PLACE\ 1,2,WEST} }
      let(:command) { Commands::Place.new(1,2,:EAST) }

      before do
        allow(CommandFileReader).to receive(:read!).with(Simulator::INPUT_FILE_NAME).and_return(command_string_array)
        allow(CommandFactory).to receive(:create).with('PLACE 1,2,EAST').and_return(command)
        allow(CommandFactory).to receive(:create).with('SOMETHING').and_raise(InvalidCommandError)
        allow(CommandFactory).to receive(:create).with('PLACE 1,2,WEST').and_return(command)
      end

      it 'create array of commands' do
        expect(CommandFileReader).to receive(:read!).with(Simulator::INPUT_FILE_NAME).and_return(command_string_array)
        start
      end

      it 'creates list of Command from the list of command string ignoring exceptions' do
        expect(CommandFactory).to receive(:create).exactly(3).times
        start
      end

      context 'when command factory returns with list of commands' do
        it 'execute the command with instance of robot and table top' do
          expect(command).to receive(:execute).twice
          start
        end
      end

      context 'calls execute of command with updated location' do
        let(:location) { Location.new(Coordinate.new(1, 2), :WEST) }

        before do
          allow(command).to receive(:execute).and_return(location)
        end

        it 'calls first command with nil location' do
          expect(command).to receive(:execute).with(any_args, nil).once
          start
        end

        it 'calls second command with location returned by first' do
          expect(command).to receive(:execute).with(any_args, location).once
          start
        end
      end
    end
  end
end
