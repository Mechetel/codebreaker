# frozen_string_literal: true

module Codebreaker
  class LongNameError < StandardError
    def message
      'Name is too long'
    end
  end
end
