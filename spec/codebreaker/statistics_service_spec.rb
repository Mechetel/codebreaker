RSpec.describe Codebreaker::StatisticsService do
  let(:game) { Codebreaker::Game.new(Codebreaker::User.new('Mechetel'), Codebreaker::Difficulty.new('hell')) }
  let(:path) { './lib/codebreaker/.yaml' }
  let(:service) { described_class.new(path) }

  before { service.store game }

  after { File.delete(path) }

  describe '#store' do
    it 'create file' do
      expect(File.exist?(path)).to be true
    end
  end

  describe '#load' do
    it 'returns Array' do
      expect(service.load.class).to be Array
    end

    it 'each array element is a Hash' do
      expect(service.load.all?(Hash)).to be true
    end
  end
end
