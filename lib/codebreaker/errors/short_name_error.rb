module Codebreaker
  class ShortNameError < StandardError
    def message
      'Name is too short'
    end
  end
end
