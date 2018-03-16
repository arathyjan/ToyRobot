require './spec/spec_helper'

RSpec.describe Direction do
  describe '.move' do
    it 'when EAST return back x and y offset for move' do
      expect(described_class.move(:EAST)).to eq [1, 0]
    end

    it 'when WEST return back x and y offset for move' do
      expect(described_class.move(:WEST)).to eq [-1, 0]
    end

    it 'when NORTH return back x and y offset for move' do
      expect(described_class.move(:NORTH)).to eq [0, 1]
    end

    it 'when SOUTH return back x and y offset for move' do
      expect(described_class.move(:SOUTH)).to eq [0, -1]
    end
  end
end
