RSpec.describe TableTop do
  describe '.within_boundary?' do
    subject(:within_boundary?) { described_class.new(5, 5).within_boundary?(coordinate) }
    context 'when given coordinate is out of boundary' do
      let(:coordinate) { Coordinate.new(5, 5) }
      it 'return back a false' do
        expect(within_boundary?).to be false
      end
    end

    context 'when x is out of boundary but y is within boundary' do
      let(:coordinate) { Coordinate.new(5, 2) }
      it 'return back a false' do
        expect(within_boundary?).to be false
      end
    end

    context 'when y is out of boundary but x is within boundary' do
      let(:coordinate) { Coordinate.new(2, 5) }
      it 'return back a false' do
        expect(within_boundary?).to be false
      end
    end

    context 'when given coordinate is at origin' do
      let(:coordinate) { Coordinate.new(0, 0) }      
      it 'return back a true' do
        expect(within_boundary?).to be true        
      end
    end

    context 'when given coordinate is at middle' do
      let(:coordinate) { Coordinate.new(2, 2) }      
      it 'return back a true' do
        expect(within_boundary?).to be true        
      end
    end
  end
end
