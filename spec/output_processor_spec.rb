require './spec/spec_helper'

RSpec.describe OutputProcessor do
  describe '.print' do
    it 'prints output when given location' do
      expect(STDOUT).to receive(:puts).with('1,2,EAST')
      described_class.print Location.new(Coordinate.new(1, 2), :EAST)
    end
  end
end
