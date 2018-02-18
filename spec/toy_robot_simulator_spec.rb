RSpec.describe ToyRobot::ToyRobotSimulator do
  describe '.start' do
    subject(:start) { described_class.new.start}

    context 'parse input file' do
      let(:command_string_array) { %w{'PLACE 1,2,EAST', MOVE} }
      before do
        allow(ToyRobot::CommandFileReader).to receive(:read!).with(ToyRobot::ToyRobotSimulator::INPUT_FILE_NAME).and_return(command_string_array)
      end

      it 'create file out of it' do
        expect(ToyRobot::CommandFileReader).to receive(:read!).with(ToyRobot::ToyRobotSimulator::INPUT_FILE_NAME).and_return(command_string_array)
        start
      end
    end
  end
end
