require './spec/spec_helper'
require 'pry'

RSpec.describe Commands::Command do
  describe '.execute' do
    it 'should return method not implemented' do
      expect{ described_class.new.execute }.to raise_error NotImplementedError
    end
  end
end
