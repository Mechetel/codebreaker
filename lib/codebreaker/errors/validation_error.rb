module Codebreaker
  class ValidationError < StandardError
    attr_reader :message
    def initialize(msg = 'Validation error')
      super(msg)
      @message = msg
    end
  end
end
