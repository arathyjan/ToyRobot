require './spec/spec_helper'
require 'pry'
RSpec.describe ToyRobot::Simulator do
  describe '.start' do
    subject(:start) { described_class.new.start}

    context 'parse input file' do
      let(:command_string_array) { %w{PLACE\ 1,2,EAST} }
      before do
        allow(ToyRobot::CommandFileReader).to receive(:read!).with(ToyRobot::Simulator::INPUT_FILE_NAME).and_return(command_string_array)
      end

      it 'create array of commands' do
        expect(ToyRobot::CommandFileReader).to receive(:read!).with(ToyRobot::Simulator::INPUT_FILE_NAME).and_return(command_string_array)
        start
      end
    end
  end
end
