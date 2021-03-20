module Codebreaker
  class Game
    MIN_CODE_NUM = 1
    MAX_CODE_NUM = 6
    DIGITS_NUM = 4

    attr_reader :user, :difficulty, :secret_code, :date, :hints_list, :attempts, :hints

    def initialize(user, difficulty)
      @user = user
      @difficulty = difficulty
      @attempts = @difficulty.attempts
      @hints = @difficulty.hints
      @secret_code = generate_secret_code
      @hints_list = @secret_code.shuffle
      @date = Time.now.getlocal
    end

    def use_hint
      @hints -= 1
      @hints_list.pop
    end

    def check_attempt(guess)
      @attempts -= 1
      GuessChecker.new(@secret_code, guess).check
    end

    def lose?
      @attempts.zero?
    end

    def win?(user_code)
      user_code == @secret_code.join
    end

    def no_hints?
      @hints.zero?
    end

    private

    def generate_secret_code
      Array.new(DIGITS_NUM) { rand(MIN_CODE_NUM..MAX_CODE_NUM) }
    end
  end
end
