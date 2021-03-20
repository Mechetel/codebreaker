module Codebreaker
  class GuessChecker
    extend Validator

    RIGHT_ANSWER_SYMBOL  = '+'.freeze
    WRONG_ANSWER_SYMBOL  = '-'.freeze

    def initialize(code, input)
      @secret_code = code.to_s.chars.map(&:to_i)
      @user_input = input.chars.map(&:to_i)
    end

    def check
      pluses + minuses
    end

    def self.validate(guess)
      validate_guess_count(guess)
      validate_guess_for_not_integer(guess)
      validate_guess_range(guess)
    end

    private

    def pluses
      answer = ''
      @user_input.map.with_index do |number, index|
        pluses_helper(answer, index) if @secret_code[index] == number
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

    def pluses_helper(answer, index)
      answer << RIGHT_ANSWER_SYMBOL
      @secret_code[index], @user_input[index] = nil
    end
  end
end
