module Codebreaker
  class GuessChecker
    RIGHT_ANSWER_SYMBOL = '+'.freeze
    WRONG_ANSWER_SYMBOL = '-'.freeze
    NOTHING_SYMBOL      = '' .freeze

    def initialize(code, input)
      @secret_code = code.to_s.split(NOTHING_SYMBOL).map(&:to_i)
      @user_input = input.to_s.split(NOTHING_SYMBOL).map(&:to_i)
    end

    def check
      pluses + minuses
    end

    def self.validate(guess)
      raise GuessIsNotInteger unless guess[/^\d+$/]
      raise DigitsCountError unless guess.size == Game::DIGITS_NUM
      raise DigitRangeError unless guess.chars.all? { |num| num.to_i.between? Game::MIN_CODE_NUM, Game::MAX_CODE_NUM }
    end

    private

    def pluses
      answer = ''
      @user_input.map.with_index do |number, index|
        if @secret_code[index] == number
          answer << RIGHT_ANSWER_SYMBOL
          @secret_code[index], @user_input[index]  = nil
        end
      end
      answer
    end

    def minuses
      answer = ''
      @user_input.compact!
      @secret_code.compact!
      near_matchers = @secret_code & @user_input
      near_matchers.size.times { answer << WRONG_ANSWER_SYMBOL }
      answer
    end
  end
end
