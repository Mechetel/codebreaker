module Codebreaker
  class DigitRangeError < StandardError
    def message
      'Digit is not in a range'
    end
  end
end
