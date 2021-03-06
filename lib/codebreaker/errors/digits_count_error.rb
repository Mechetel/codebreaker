module Codebreaker
  class DigitsCountError < StandardError
    def message
      'Invalid digits count'
    end
  end
end
