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
        expect(CommandFactory).to receive(:create).exactly(3).times
        start
      end
    end
  end
end
