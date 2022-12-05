RSpec.describe Codebreaker::Difficulty do
  let(:difficulty) { described_class.new(level) }
  let(:level) { 'easy' }
  let(:invalid_difficulty) { described_class.new(invalid_level) }
  let(:invalid_level) { 'qwerty' }
  let(:difficulty_constant) { Difficulty::DIFFICULTIES }

  describe '#level' do
    context 'when level set' do
      it 'level is a symbol' do
        expect(difficulty.level).to eq(:easy)
      end
    end
  end

  describe '#errors' do
    context 'when errors set' do
      it 'has 0 items' do
        expect(difficulty.errors.size).to eq(0)
      end
    end
  end

  describe '#initialize' do
    it 'has level and errors field' do
      expect(difficulty.instance_variables).to include(:@level, :@errors)
    end
  end

  describe '#valid?' do
    context 'when entered level of difficulty is wrong' do
      subject(:invalid_difficulty_valid?) { invalid_difficulty.valid? }

      before do
        invalid_difficulty_valid?
      end

      it 'validation returns false' do
        expect(invalid_difficulty_valid?).to eq false
      end

      it 'adds DifficultyError to errors' do
        expect(invalid_difficulty.errors).to include Codebreaker::ValidationError
      end
    end

    context 'when entered level of difficulty is right' do
      subject(:valid_difficulty_valid?) { difficulty.valid? }

      before do
        valid_difficulty_valid?
      end

      it 'validation returns true' do
        expect(valid_difficulty_valid?).to eq true
      end

      it 'adds nothing to errors' do
        expect(difficulty.errors).to be_empty
      end

      it 'returs number of attempts of appropriate difficulty' do
        expect(difficulty.attempts).to eq(15)
      end

      it 'returs number of hints of appropriate difficulty' do
        expect(difficulty.hints).to eq(2)
      end
    end
  end
end
