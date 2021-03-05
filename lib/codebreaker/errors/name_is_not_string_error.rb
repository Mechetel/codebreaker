# frozen_string_literal: true

module Codebreaker
  class NameIsNotStringError < StandardError
    def message
      'Name should be an instance of String'
    end
  end
end
