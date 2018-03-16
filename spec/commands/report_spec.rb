require './spec/spec_helper'

RSpec.describe Commands::Report do
  describe '.execute' do
    let(:current_location) { Location.new(Coordinate.new(2, 2), :WEST) } 
    subject(:execute) {
      Commands::Report.new.execute(Robot.new, 
        TableTop.new(5, 5),
        current_location 
        )
    }
    context 'when current location is not nil' do
      it 'return back the same location send to it' do
        expect(execute).to eq current_location
      end

      it 'calls output processor with current location' do
        expect(OutputProcessor).to receive(:print).with(current_location)
        execute
      end
    end
    
    context 'when current location is nil' do
      let(:current_location) { nil }
      
      it 'will return back nil' do
        expect(execute).to be nil
      end

      it 'doesnt calls output processor with current location' do
        expect(OutputProcessor).not_to receive(:print).with(current_location)
        execute
      end
    end
  end
end
