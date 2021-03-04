module Codebreaker
  class Difficulty
    include Validator
    attr_reader :difficulty, :errors

    DIFFICULTIES = { easy: { attempts: 15, hints: 2 },
                     medium: { attempts: 10, hints: 1 },
                     hell: { attempts: 5, hints: 1 } }.freeze

    def initialize(difficulty)
      @difficulty = difficulty.to_sym
      @errors = []
    end

    def attempts
      DIFFICULTIES[@difficulty][:attempts]
    end

    def hints
      DIFFICULTIES[@difficulty][:hints]
    end

    private

    def validate!
      validate_difficulty
    end

    def validate_difficulty
      errors << DifficultyError unless DIFFICULTIES_LIST.include? difficulty
    end
  end
end
