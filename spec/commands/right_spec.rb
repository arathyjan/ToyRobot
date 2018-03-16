require './spec/spec_helper'

RSpec.describe Commands::Right do
  describe '.execute' do
    let(:current_location) { Location.new(Coordinate.new(2, 2), current_direction) } 
    subject(:execute) {
      Commands::Right.new.execute(
        TableTop.new(5, 5),
        current_location 
        )
    }

    context 'when facing WEST' do
      let(:current_direction) { :WEST } 
      it 'will return the new location' do
        expected_new_location = Location.new(Coordinate.new(2, 2), :NORTH)
        
        new_location = execute
        
        expect(new_location.coordinate.x).to eql expected_new_location.coordinate.x
        expect(new_location.coordinate.y).to eql expected_new_location.coordinate.y
        expect(new_location.direction).to eql expected_new_location.direction
      end
    end

    context 'when facing EAST' do
      let(:current_direction) { :EAST } 
      
      it 'will return the new location' do
        expected_new_location = Location.new(Coordinate.new(2, 2), :SOUTH)
        
        new_location = execute
        
        expect(new_location.coordinate.x).to eql expected_new_location.coordinate.x
        expect(new_location.coordinate.y).to eql expected_new_location.coordinate.y
        expect(new_location.direction).to eql expected_new_location.direction
      end
    end

    context 'when facing SOUTH' do
      let(:current_direction) { :SOUTH } 
      
      it 'will return the new location' do
        expected_new_location = Location.new(Coordinate.new(2, 2), :WEST)
        
        new_location = execute
        
        expect(new_location.coordinate.x).to eql expected_new_location.coordinate.x
        expect(new_location.coordinate.y).to eql expected_new_location.coordinate.y
        expect(new_location.direction).to eql expected_new_location.direction
      end
    end

    context 'when facing NORTH' do
      let(:current_direction) { :NORTH }
      
      it 'will return the new location' do
        expected_new_location = Location.new(Coordinate.new(2, 2), :EAST)
        
        new_location = execute
        
        expect(new_location.coordinate.x).to eql expected_new_location.coordinate.x
        expect(new_location.coordinate.y).to eql expected_new_location.coordinate.y
        expect(new_location.direction).to eql expected_new_location.direction
      end
    end

    context 'when current location is nil' do
      let(:current_location) { nil }
      
      it 'will return back nil' do
        expect(execute).to be nil
      end
    end
  end
end
