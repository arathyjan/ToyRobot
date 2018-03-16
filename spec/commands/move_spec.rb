require './spec/spec_helper'

RSpec.describe Commands::Move do
  describe '.execute' do
    subject(:execute) {
      Commands::Move.new.execute(Robot.new, 
        TableTop.new(5, 5), 
        current_location)
    }
    
    context 'when move will place robot outside boundary of table top' do
      context 'when y is 0 and direction is WEST' do
        let(:current_location) { Location.new(Coordinate.new(0, 2), :WEST) }
        it 'will return the current location' do
          expect(execute).to eql current_location
        end
      end

      context 'when y is 4 and direction is EAST' do
        let(:current_location) { Location.new(Coordinate.new(4, 0), :EAST) }
        it 'will return the current location' do
          expect(execute).to eql current_location
        end
      end

      context 'when x is 0 and direction is SOUTH' do
        let(:current_location) { Location.new(Coordinate.new(2, 0), :SOUTH) }
        it 'will return the current location' do
          expect(execute).to eql current_location
        end
      end

      context 'when x is 4 and direction is NORTH' do
        let(:current_location) { Location.new(Coordinate.new(2, 4), :NORTH) }
        it 'will return the current location' do
          expect(execute).to eql current_location
        end
      end
    end

    context 'when move will place robot inside boundary of table top' do
      context 'when facing WEST' do
        let(:current_location) { Location.new(Coordinate.new(2, 2), :WEST) }
        
        it 'will return the new location' do
          expected_new_location = Location.new(Coordinate.new(1, 2), :WEST)
          
          new_location = execute
          
          expect(new_location.coordinate.x).to eql expected_new_location.coordinate.x
          expect(new_location.coordinate.y).to eql expected_new_location.coordinate.y
          expect(new_location.direction).to eql expected_new_location.direction
        end
      end

        context 'when facing EAST' do
        let(:current_location) { Location.new(Coordinate.new(2, 2), :EAST) }
        
        it 'will return the new location' do
          expected_new_location = Location.new(Coordinate.new(3, 2), :EAST)
          
          new_location = execute
          
          expect(new_location.coordinate.x).to eql expected_new_location.coordinate.x
          expect(new_location.coordinate.y).to eql expected_new_location.coordinate.y
          expect(new_location.direction).to eql expected_new_location.direction
        end
      end

        context 'when facing SOUTH' do
        let(:current_location) { Location.new(Coordinate.new(2, 2), :SOUTH) }
        
        it 'will return the new location' do
          expected_new_location = Location.new(Coordinate.new(2, 1), :SOUTH)
          
          new_location = execute
          
          expect(new_location.coordinate.x).to eql expected_new_location.coordinate.x
          expect(new_location.coordinate.y).to eql expected_new_location.coordinate.y
          expect(new_location.direction).to eql expected_new_location.direction
        end
      end

      context 'when facing NORTH' do
        let(:current_location) { Location.new(Coordinate.new(2, 2), :NORTH) }
        
        it 'will return the new location' do
          expected_new_location = Location.new(Coordinate.new(2, 3), :NORTH)
          
          new_location = execute
          
          expect(new_location.coordinate.x).to eql expected_new_location.coordinate.x
          expect(new_location.coordinate.y).to eql expected_new_location.coordinate.y
          expect(new_location.direction).to eql expected_new_location.direction
        end
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
