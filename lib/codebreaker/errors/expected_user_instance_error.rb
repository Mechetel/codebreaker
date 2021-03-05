module Codebreaker
  class ExpectedUserInstanceError < StandardError
    def message
      'Object should be an instance of User class'
    end
  end
end
