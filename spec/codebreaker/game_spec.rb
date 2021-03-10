require 'spec_helper'

RSpec.describe Codebreaker::Game do
  let(:user) { Codebreaker::User.new user_name }
  let(:user_name) { 'Mechetel' }
  let(:difficulty) { Codebreaker::Difficulty.new difficulty_level }
  let(:difficulty_level) { 'hell' }
  let(:game) { described_class.new user, difficulty }

  describe '#initialize' do
    context 'when game starts it initializes with secret number' do
      subject(:game_secret_number) { game.secret_code }

      let(:secret_number) { '6616' }

      it 'has secret number' do
        allow_any_instance_of(described_class).to receive(:generate_secret_code).and_return(secret_number)
        expect(game_secret_number).to eq(secret_number)
      end

      it 'has valid secret number length' do
        expect(game_secret_number.length).to eq(4)
      end

      it 'has valid secret number digits' do
        game_secret_number.each do |digit|
          expect(digit.to_i).to be_between(1, 6)
        end
      end

      it 'secret code is an Array' do
        expect(game_secret_number.class).to eq Array
      end

      it 'secret code size equal to DIGITS_NUM constant' do
        expect(game_secret_number.size).to eq described_class::DIGITS_NUM
      end

      it 'each element of secret code is between MIN_CODE_NUM and MAX_CODE_NUM contstants' do
        game_secret_number.each do |digit|
          expect(digit.to_i).to be_between(described_class::MIN_CODE_NUM, described_class::MAX_CODE_NUM).inclusive
        end
      end

      it 'hints list is equal to secret code' do
        expect(game.hints_list).to eq game_secret_number
      end
    end
  end

  it 'user field class equal to User' do
    expect(game.user.class).to eq Codebreaker::User
  end

  it 'difficulty field class equal to Difficulty' do
    expect(game.difficulty.class).to eq Codebreaker::Difficulty
  end

  describe '#take_hint' do
    subject(:game_use_hint) { game.use_hint }

    it 'returns Integer' do
      expect(game_use_hint.class).to eq Integer
    end

    it 'returns only one number' do
      expect(game_use_hint.to_s.size).to eq 1
    end

    it 'changes current_hints counter by 1' do
      expect { game_use_hint }.to change { game.instance_variable_get(:@hints) }.by(-1)
    end

    it 'removes one element from hints list' do
      expect { game_use_hint }.to change { game.instance_variable_get(:@hints_list).size }.by(-1)
    end
  end

  describe '#lose?' do
    subject(:game_lose) { game.lose? }

    it 'returns false when attempts are set' do
      expect(game_lose).to be_falsey
    end

    it 'returns true when attempts are equal to zero' do
      game.instance_variable_set(:@attempts, 0)
      expect(game_lose).to be_truthy
    end
  end

  describe '#win?' do
    it 'returns false when user code is not equal to secret code' do
      game.instance_variable_set(:@secret_code, [1, 2, 3, 4])
      expect(game).not_to be_win('2345')
    end

    it 'returns true when user code is equal to secret code' do
      expect(game).to be_win(game.secret_code.join)
    end
  end

  describe '#no_hints?' do
    subject(:game_no_hints) { game.no_hints? }

    it 'returns false when hints are set' do
      expect(game_no_hints).to be_falsey
    end

    it 'returns true when hints are equal to zero' do
      game.instance_variable_set(:@hints, 0)
      expect(game_no_hints).to be_truthy
    end
  end

  describe '#new_game' do
    subject(:hints_at_new_game) { game.difficulty.hints }

    let(:attempts_at_new_game) { game.difficulty.attempts }

    before do
      game.new_game
    end

    it 'set secret code Array to secret_code' do
      expect(game.secret_code.class).to eq Array
    end

    it 'set secret code to hints_list' do
      expect(game.hints_list).to eq game.secret_code
    end

    it 'current_attempts are equal to previous game current_attempts' do
      expect(game.attempts).to eq attempts_at_new_game
    end

    it 'current_hints are equal to previous game current_hints' do
      expect(game.hints).to eq hints_at_new_game
    end
  end

  describe '#check_attempt' do
    it 'returns String' do
      expect(game.check_attempt('2456').class).to eq String
    end

    it 'returns string which size is between 0 and 4' do
      expect(game.check_attempt('6163').length).to be_between(0, 4).inclusive
    end
  end
end
