require 'spec_helper'

RSpec.describe Codebreaker::User do
  let(:user) { described_class.new name }
  let(:name) { 'Mechetel' }
  let(:short_name_user) { described_class.new short_name }
  let(:short_name) { 'Me' }
  let(:long_name_user) { described_class.new long_name }
  let(:long_name) { 'dima' * 10 }
  let(:invalid_user) { described_class.new inappropriate_user_name }
  let(:inappropriate_user_name) { 322 }

  describe '#name' do
    context 'when name set' do
      it 'has appropriate name' do
        expect(user.name).to eq(name)
      end
    end
  end

  describe '#errors' do
    context 'when errors set' do
      it 'has 0 items' do
        expect(user.errors.size).to eq(0)
      end
    end
  end

  describe '#initialize' do
    it 'has name and errors field field' do
      expect(user.instance_variables).to include(:@name, :@errors)
    end
  end

  describe 'check User constants' do
    it 'check content of NAME_MIN_LENGTH constant' do
      expect(described_class::NAME_MIN_LENGTH).to eq(3)
    end

    it 'check content of NAME_MAX_LENGTH constant' do
      expect(described_class::NAME_MAX_LENGTH).to eq(20)
    end
  end

  describe '#valid?' do
    context 'when entered name is too short' do
      it 'returns false' do
        expect(short_name_user.valid?).to be_falsey
      end

      it 'adds ShortNameError to errors' do
        short_name_user.valid?
        expect(short_name_user.errors).to include Codebreaker::ShortNameError
      end
    end

    context 'when entered name is too long' do
      it 'returns false' do
        expect(long_name_user.valid?).to be_falsey
      end

      it 'adds longnameerror to errors' do
        long_name_user.valid?
        expect(long_name_user.errors).to include Codebreaker::LongNameError
      end
    end

    context 'when entered name is not an instance of String' do
      it 'returns false' do
        expect(invalid_user.valid?).to be_falsey
      end

      it 'adds NameIsNotStringError to errors' do
        invalid_user.valid?
        expect(invalid_user.errors).to include Codebreaker::NameIsNotStringError
      end
    end
  end
end
