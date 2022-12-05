module Codebreaker
  class Difficulty
    include Validator

    DIFFICULTIES = {
      easy: { attempts: 15, hints: 2 },
      medium: { attempts: 10, hints: 1 },
      hell: { attempts: 5, hints: 1 }
    }.freeze

    attr_reader :level, :errors

    def initialize(level)
      @level = level.to_sym
      @errors = []
    end

    def attempts
      DIFFICULTIES[@level][:attempts]
    end

    def hints
      DIFFICULTIES[@level][:hints]
    end

    def valid?
      validate_difficulty(@level, @errors)
      @errors.empty?
    end
  end
end
