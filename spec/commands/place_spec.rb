require './spec/spec_helper'

RSpec.describe Commands::Place do
  describe '.execute' do
    context 'when coordinates are out of boundary' do
      it 'doesnot change the position of robot' do
        # expect{ described_class.new.execute }.to raise_error NotImplementedError
      end
    end

    context 'when coordinates are within the boundary' do
      it 'place the robot in that coordinate and direction' do
        # expect{ described_class.new.execute }.to raise_error NotImplementedError
      end
    end
  end
end
