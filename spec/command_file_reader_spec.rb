require './spec/spec_helper'

RSpec.describe CommandFileReader do

  describe '.read!' do
    context 'when valid file' do
      subject(:read!) { described_class.read!('./spec/input_test.txt') }

      it 'return a array of text command' do
        expect(read!.size).to eq 6
      end

      it 'return a array of text command which is stripped' do
        expect(read![0]).to eq 'PLACE 1,2,EAST'
      end
    end

    context 'when invalid file' do
      it 'return an exception' do
        expect { described_class.read!('./spec/non_existing_file.txt') }.to raise_error StandardError
      end
    end
  end
end
