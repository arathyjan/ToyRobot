require './spec/spec_helper'

RSpec.describe ToyRobot::CommandFileReader do

  describe '.read!' do
    subject(:read!) { described_class.read!('./spec/input_test.txt') }

    it 'return a array of text command' do
      expect(read!.size).to eq 6
    end

    it 'return a array of text command which is stripped' do
      expect(read![0]).to eq 'PLACE 1,2,EAST'
    end
  end
end
