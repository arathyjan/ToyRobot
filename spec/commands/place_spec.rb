require './spec/spec_helper'

RSpec.describe Commands::Place do
  describe '.execute' do
    let(:current_location) { Location.new(Coordinate.new(2, 5), :WEST) }

    subject(:execute) {
      Commands::Place
      .new(x_coordinate, y_coordinate, direction)
      .execute(Robot.new, TableTop.new(5, 5), current_location)
    }

    context 'when coordinates are out of boundary' do
      let(:x_coordinate) { 5 }
      let(:y_coordinate) { 5 }
      let(:direction) { :EAST }

      it 'doesnot change the position or direction of robot' do
        expect(execute).to be current_location
      end
    end

    context 'when coordinates are within the boundary' do
      let(:x_coordinate) { 1 }
      let(:y_coordinate) { 2 }
      let(:direction) { :WEST }

      it 'place the robot in that coordinate and direction' do
        expected_new_location = Location.new(Coordinate.new(1, 2), :WEST)
        new_location = execute
        expect(new_location.coordinate.x).to eql expected_new_location.coordinate.x
        expect(new_location.coordinate.y).to eql expected_new_location.coordinate.y
        expect(new_location.direction).to eql expected_new_location.direction
      end
    end
  end
end
