RSpec.describe Codebreaker::GuessChecker do
  describe '#initialize' do
    let(:guess_checker) { described_class.new('1234', '2345') }

    it 'has secret_code and user_input field' do
      expect(guess_checker.instance_variables).to include(:@secret_code, :@user_input)
    end
  end

  describe '#validate' do
    it 'raises DigitsCountError when digits count is invalid' do
      expect { described_class.validate('102') }.to raise_error Codebreaker::ValidationError
    end

    it 'raises DigitsCountError when guess is not a numbers' do
      expect { described_class.validate('sdfg') }.to raise_error Codebreaker::ValidationError
    end

    it 'raises DigitRangeError when any digit is not in the range' do
      expect { described_class.validate('6969') }.to raise_error Codebreaker::ValidationError
    end
  end

  describe '#result' do
    context 'when have some result' do
      [
        { secret_number: '6543', input: '5643', result: '++--' },
        { secret_number: '6543', input: '6411', result: '+-' },
        { secret_number: '6543', input: '6544', result: '+++' },
        { secret_number: '6543', input: '3456', result: '----' },
        { secret_number: '6543', input: '6666', result: '+' },
        { secret_number: '6543', input: '2666', result: '-' },
        { secret_number: '6543', input: '2222', result: '' },
        { secret_number: '6666', input: '1661', result: '++' },
        { secret_number: '1234', input: '3124', result: '+---' },
        { secret_number: '1234', input: '1524', result: '++-' },
        { secret_number: '1234', input: '1234', result: '++++' }
      ].each do |line|
        it "returns #{line[:result]} when secret number - #{line[:secret_number]} and input - #{line[:input]}" do
          expect(described_class.new(line[:secret_number].chars.map(&:to_i), line[:input]).check).to eq(line[:result])
        end
      end
    end
  end
end
