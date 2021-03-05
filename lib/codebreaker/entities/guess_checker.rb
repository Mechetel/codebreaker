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
      @user_input.each_char.each_with_index do |digit, index|
        if @secret_code[index] == digit
          answer.push RIGHT_ANSWER_SYMBOL
        elsif @secret_code.include? digit
          answer.push WRONG_ANSWER_SYMBOL
        end
      end
      answer.sort.join
    end
  end
end
