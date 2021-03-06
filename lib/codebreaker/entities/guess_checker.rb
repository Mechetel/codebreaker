module Codebreaker
  class GuessChecker
    RIGHT_ANSWER_SYMBOL = '+'.freeze
    WRONG_ANSWER_SYMBOL = '-'.freeze
    attr_reader :secret_code, :user_code

    def initialize(code, input)
      @secret_code = code
      @user_input = input
    end


    def check
      answer = []
      @user_input.split('').map(&:to_i).each_with_index do |digit, index|
        if @secret_code[index] == digit
          answer.push RIGHT_ANSWER_SYMBOL
        elsif @secret_code.include? digit
          answer.push WRONG_ANSWER_SYMBOL
        end
      end
      answer.sort.join
    end

    def self.validate(guess)
      raise DigitsCountError unless guess.size == Game::DIGITS_NUM
      raise DigitRangeError unless guess.chars.all? { |num| num.to_i.between? Game::MIN_CODE_NUM, Game::MAX_CODE_NUM }
    end
  end
end
