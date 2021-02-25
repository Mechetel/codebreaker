module Codebreaker
  class Game
    SECRET_CODE_SIZE = 4
    SECRET_CODE_RANGE = (1..6).freeze
    attr_reader :secret_code, :hints, :hint_number, :attempts, :player, :result, :difficulty

    def initialize(player, difficulty)
      @player = player
      @difficulty = difficulty
      @attempts = difficulty.attempts
      @hints = difficulty.hints
      @secret_code = generate_secret_code
      @hint_number = @secret_code.clone
    end

    private

    def generate_secret_code
      Array.new(SECRET_CODE_SIZE) { rand(SECRET_CODE_RANGE) }
    end  end
end
