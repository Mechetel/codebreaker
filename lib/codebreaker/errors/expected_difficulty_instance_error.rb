# frozen_string_literal: true

module Codebreaker
  class ExpectedDifficultyInstanceError < StandardError
    def message
      'Object should be an instance of Difficulty class'
    end
  end
end
