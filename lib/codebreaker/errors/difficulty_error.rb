# frozen_string_literal: true

module Codebreaker
  class DifficultyError < StandardError
    def message
      'No such difficulty'
    end
  end
end
