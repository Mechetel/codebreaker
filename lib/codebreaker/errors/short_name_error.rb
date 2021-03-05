# frozen_string_literal: true

module Codebreaker
  class ShortNameError < StandardError
    def message
      'Name is too short'
    end
  end
end
