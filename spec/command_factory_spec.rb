require './spec/spec_helper'

RSpec.describe ToyRobot::CommandFactory do
  describe '.parse' do
    subject(:parse) { described_class.parse 'PLACE 1,2,EAST' }
    
    it 'parse PLACE 1,2,EAST command string to Place Command' do
      parse
    end
  end
end
