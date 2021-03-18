module Codebreaker
  class GuessChecker
    RIGHT_ANSWER_SYMBOL  = '+'.freeze
    WRONG_ANSWER_SYMBOL  = '-'.freeze
    NOTHING_SYMBOL       = ''.freeze
    GUESS_IS_NOT_INTEGER = 'Guess should be Integer class'.freeze
    DIGITS_COUNT_ERROR   = 'Invalid digits count'.freeze
    DIGIT_RANGE_ERROR    = 'Digit is not in a range'.freeze

    def initialize(code, input)
      @secret_code = code.to_s.chars.map(&:to_i)
      @user_input = input.to_s.chars.map(&:to_i)
    end

    def check
      pluses + minuses
    end

    def self.validate(guess)
      raise ValidationError, GUESS_IS_NOT_INTEGER unless guess[/^\d+$/]
      raise ValidationError, DIGITS_COUNT_ERROR   unless guess.size == Game::DIGITS_NUM
      raise ValidationError, DIGIT_RANGE_ERROR    unless guess.chars.all? do |num|
                                                           num.to_i.between? Game::MIN_CODE_NUM, Game::MAX_CODE_NUM
                                                         end
    end

    private

    def pluses
      answer = ''
      @user_input.map.with_index do |number, index|
        if @secret_code[index] == number
          answer << RIGHT_ANSWER_SYMBOL
          @secret_code[index], @user_input[index] = nil
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
